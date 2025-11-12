#!/bin/bash
#
# nenv.sh - New Environment Setup Script
#
# This script installs common development packages and sets up bash aliases.
# It is designed to be idempotent and can be run with flags to
# perform specific actions.
#
# USAGE: sudo ./nenv.sh [FLAG]
#

# --- Configuration ---

# Exit immediately if a command exits with a non-zero status.
set -e

# Define the packages to install
PACKAGES=(
    "xterm"
    "neovim"
    "net-tools"
    "ripgrep"
    "fzf"
)

# Define the .bashrc markers
START_MARKER="# START NENV CONFIG"
END_MARKER="# END NENV CONFIG"

# --- Default Flags ---
# 1 = true, 0 = false
# Default is to run both tasks
DO_INSTALL=1
DO_BASHRC=1

# --- Helper Functions ---

# Function to display help message
show_help() {
    echo "Usage: sudo ./nenv.sh [FLAG]"
    echo
    echo "Flags:"
    echo "  (no flag)    Run both install and bashrc update (default)."
    echo "  -i, --install  Only install packages."
    echo "  -b, --bashrc   Only update the .bashrc aliases."
    echo "  -h, --help     Show this help message."
    echo
    echo "Note: -i and -b flags must be run with sudo."
}

# Function to install packages
do_package_install() {
    echo -e "\n📦 [Task 1/1] Updating and Installing Packages..."
    echo "    -> Updating package lists..."
    apt update
    
    echo "    -> Installing: ${PACKAGES[*]}..."
    apt install -y "${PACKAGES[@]}"
    
    echo "✅ Package installation complete."
}

# Function to update .bashrc
# Requires $TARGET_BASHRC, $TARGET_USER, $START_MARKER, $END_MARKER
# to be set as global variables.
do_bashrc_update() {
    echo -e "\n📝 [Task 1/1] Updating $TARGET_BASHRC..."

    # 1. Delete the *entire* block between the markers.
    echo "    -> Removing old configuration block (if any)..."
    sed -i "\|$START_MARKER|,\|$END_MARKER|d" "$TARGET_BASHRC" || true

    # 2. Append the new, complete block to the end of the file.
    echo "    -> Appending new configuration block..."
    cat <<'EOF' >> "$TARGET_BASHRC"

# START NENV CONFIG
# This block is automatically managed by the nenv.sh script.
# Do not edit this block manually, as changes will be overwritten.

# --- Shortcuts ---
alias r="resize && reset"
alias b="source ~/.bashrc"
alias nb="sudo vim ~/.bashrc"

# --- watch ---
alias wa="watch --color 'tree -C'"
alias wls="watch --color 'ls -alh --color'"

# --- Board kernel model ---
alias kk="cat /proc/device-tree/model && echo"

# --- Highlight & pigmentize ---
alias c='pygmentize -g'
alias cats='highlight -O ansi --force'

# --- Networking stuff ---
alias ipv4='ip address | rg inet'

# --- pwd ready for scp ---
alias pwds='echo "$(whoami)@$(hostname -I | awk '\''{print $1}'\''):`pwd`"'

# --- dmesg & journalctl stuff ---
alias dmf="dmesg --follow"
alias dm="dmesg | rg"
alias jm="journalctl | rg"

# --- ripgrep ---
alias rgd="rg -uu -g '*.dts' -g '*.dtsi'"   # for dtsi & dts files

# --- FZF Configuration ---
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200 -p'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
--bind 'ctrl-y:execute-silent(echo {+} | xclip -se c)'
"

# END NENV CONFIG
EOF

    # 3. Ensure the file is still owned by the original user
    chown "$TARGET_USER:$TARGET_USER" "$TARGET_BASHRC"
    
    echo "✅ .bashrc update complete."
}


# --- 1. Argument Parsing ---
# Parse the first argument ($1)
case "$1" in
    -h|--help)
        show_help
        exit 0
        ;;
    -i|--install)
        echo "Mode: Install Only"
        DO_BASHRC=0
        ;;
    -b|--bashrc)
        echo "Mode: .bashrc Only"
        DO_INSTALL=0
        ;;
    "")
        # No arguments, use default (do both)
        echo "Mode: Default (Install & .bashrc)"
        ;;
    *)
        # Unknown argument
        echo "❌ Error: Unknown option '$1'"
        echo
        show_help
        exit 1
        ;;
esac

# --- 2. Sanity Checks & User Identification ---
# This check happens *after* the --help check
if [[ $EUID -ne 0 ]]; then
   echo "❌ This script must be run as root. Please use: sudo ./nenv.sh" 
   exit 1
fi

# Find the original user's home directory
if [[ -z "$SUDO_USER" || -z "$SUDO_HOME" ]]; then
    echo "❌ Error: Could not determine the original user."
    echo "This script is designed to be run with sudo by a regular user."
    exit 1
fi

# Set global variables for our functions to use
TARGET_USER="$SUDO_USER"
TARGET_HOME="$SUDO_HOME"
TARGET_BASHRC="$TARGET_HOME/.bashrc"

echo "🔧 Running setup for user: $TARGET_USER"
if [[ $DO_BASHRC -eq 1 ]]; then
    echo "🔧 Target .bashrc file: $TARGET_BASHRC"
fi

# --- 3. Main Execution ---

if [[ $DO_INSTALL -eq 1 ]]; then
    do_package_install
fi

if [[ $DO_BASHRC -eq 1 ]]; then
    do_bashrc_update
fi

# --- 4. Finalization ---
echo -e "\n🎉 Setup finished!"

if [[ $DO_BASHRC -eq 1 ]]; then
    echo "To apply changes, please run: source $TARGET_BASHRC"
    echo "Or simply log out and log back in."
fi