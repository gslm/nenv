# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='pls -s size'
alias la='ls -A'
alias l='ls -CF'

# Git aliases
alias gs='git status'
alias gl='git log'
alias gp='git push'
alias icc='git config --global user.name guilhermes && git config --global user.email guilhermes@inatel.br && git config --list'
alias ghicc='git config --global user.name guilhermes-inatel && git config --global user.email guilhermes@inatel.br && git config --list'
alias gslm='git config --global user.name gslm && git config --global user.email gslmexperi@gmail.com && git config --list'
alias gfc='git reset --hard && git clean -dfx'
# alias gag-icc='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/github-gslm-icc'
# alias gag-pixel='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/pixelti'
# alias gag='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/bitbucket-icc'
alias gag='eval "$(ssh-agent -s)" && find ~/.ssh -type f ! -name "*.pub" ! -name "known_hosts*" ! -name "config" ! -name "authorized_keys*" -exec ssh-add {} \;'

# zsh aliases
alias z="source ~/.zshrc"
alias cz="code ~/.zshrc"
alias czn="code ~/nenv/zsh/.zshrc"
alias cterm="code ~/.config/terminator/config"
alias bz="ct ~/.zshrc"
alias nz="nvim ~/.zshrc"

# nvim aliases
alias cnv="cd /home/guilhermes/.config/nvim"
alias vim="nvim"
alias vi="nvim"

# others
alias r="resize && reset"

#keyd aliases
alias ck="code /etc/keyd/default.conf"
alias k="sudo keyd reload"

# picocom aliases
alias p0="picocom -b 115200 /dev/ttyUSB0"
alias p1="picocom -b 115200 /dev/ttyUSB1"
alias p2="picocom -b 115200 /dev/ttyUSB2"
alias p3="picocom -b 115200 /dev/ttyUSB3"
alias p4="picocom -b 115200 /dev/ttyUSB4"
alias acm0="picocom -b 115200 /dev/ttyACM0"
alias acm1="picocom -b 115200 /dev/ttyACM1"
alias acm2="picocom -b 115200 /dev/ttyACM2"
alias acm3="picocom -b 115200 /dev/ttyACM3"
alias acm4="picocom -b 115200 /dev/ttyACM4"
alias prk0="picocom -b 1500000 /dev/ttyUSB0"
alias prk1="picocom -b 1500000 /dev/ttyUSB1"
alias acm0x="picocom -b 115200 -r -l --omap crcrlf --imap 8bithex -f n /dev/ttyACM0"
alias acm1x="picocom -b 115200 -r -l --omap crcrlf --imap 8bithex -f n /dev/ttyACM1"

# tmux aliases
alias tmux='tmux -2'
alias ctmux="code ~/.tmux.conf"
alias tks="tmux kill-server"
alias t="tmux"
alias tl="tmux list-sessions"
alias t0="tmux attach -t 0"
alias t1="tmux attach -t 1"
alias t2="tmux attach -t 2"
alias t3="tmux attach -t 3"
alias tk="tmux kill-session -t"
alias tk0="tmux kill-window -t 0"
alias tk1="tmux kill-window -t 1"
alias tk2="tmux kill-window -t 2"
alias tk3="tmux kill-window -t 3"
alias ts="tmux source-file ~/.tmux.conf"

# --- GIN ---
# alias gb="./cqfd"
# alias gcmd="./cqfd -b cmd"
# alias gbk="./cqfd -b kernel"
# alias gbkm="./cqfd -b kernel && ./mkfirmware.sh"
# alias gbkmf="./cqfd -b kernel && ./mkfirmware.sh && sudo ./rkflash.sh boot"
# alias gbb="./cqfd -b buildroot"
# alias gbbm="./cqfd -b buildroot && ./mkfirmware.sh"
# alias gbbmf="./cqfd -b buildroot && ./mkfirmware.sh && sudo ./rkflash.sh rootfs"
# alias gf="sudo ./rkflash.sh"
# alias gfa="sudo ./rkflash.sh boot && sudo ./rkflash.sh rootfs && sudo ./rkflash.sh rd"
# alias gfk="sudo ./rkflash.sh boot && sudo ./rkflash.sh rd"
# alias gfb="sudo ./rkflash.sh rootfs && sudo ./rkflash.sh rd"
# alias gri="repo init -u ssh://git@bitbucket.inatel.br:7999/gin-tmp/manifests.git --no-clone-bundle --config-name"
# alias grs="repo sync"
# alias gkm="make ARCH=arm icc_rockchip_linux_gin_defconfig menuconfig"
# alias gks="make ARCH=arm savedefconfig"
# alias gbu="./cqfd -b uboot && ./mkfirmware.sh"
# alias gfu="sudo ./rkflash.sh uboot && sudo ./rkflash.sh rd"

# --- GAR ---
function deploy_kernel_gar() {
    if [ -z "$1" ]; then
        echo "Usage: deploy_kernel_gar <target_board_ip> [-r]"
        return 1
    fi

    TARGET_IP="$1"
    REBUILD=false

    # Check for rebuild flag
    if [ "$2" = "-r" ]; then
        REBUILD=true
    fi

    # Conditionally rebuild
    if $REBUILD; then
        echo "Rebuild requested: building the kernel..."
        sudo ./build.sh BOARD=garv1 BRANCH=current BUILD_OPT=kernel \
            KERNEL_CONFIGURE=no IGNORE_UPDATES=yes
        if [ $? -ne 0 ]; then
            echo "Kernel build failed. Aborting deployment."
            return 1
        fi
    else
        echo "No rebuild flag passed; skipping build."
    fi

    # Define the output .deb file path
    DEB_FILE="output/debs/linux-image-current-gar-rk356x_0.0.1_arm64.deb"
    if [ ! -f "$DEB_FILE" ]; then
        echo "Error: Kernel package '$DEB_FILE' not found."
        return 1
    fi

    # Copy the deb file to the target board
    echo "Copying $DEB_FILE to $TARGET_IP:/tmp ..."
    scp "$DEB_FILE" root@"$TARGET_IP":/tmp
    if [ $? -eq 0 ]; then
        echo "Deployment complete. On the target board, run update_kernel_deb.sh."
    else
        echo "SCP failed. Please check the target IP or network connectivity."
        return 1
    fi
}


alias gar="cd /media/guilhermes/ssd/GAR"

# Full build
alias garb='sudo -E ./build.sh BOARD=garv1 BRANCH=current BUILD_OPT=image RELEASE=bookworm BUILD_MINIMAL=no BUILD_DESKTOP=no KERNEL_CONFIGURE=no COMPRESS_OUTPUTIMAGE=img IGNORE_UPDATES=yes'
alias garbc='sudo -E ./build.sh BOARD=garv1 BRANCH=current BUILD_OPT=image RELEASE=bookworm BUILD_MINIMAL=no BUILD_DESKTOP=no KERNEL_CONFIGURE=no COMPRESS_OUTPUTIMAGE=img IGNORE_UPDATES=yes | tee build.log && ansi2html < build.log > build.html && google-chrome build.html'

# Kernel build only
alias garbk='sudo ./build.sh BOARD=garv1 BRANCH=current BUILD_OPT=kernel KERNEL_CONFIGURE=no IGNORE_UPDATES=yes'
alias garbkc='sudo ./build.sh BOARD=garv1 BRANCH=current BUILD_OPT=kernel KERNEL_CONFIGURE=no IGNORE_UPDATES=yes | tee build-kernel.log && ansi2html < build-kernel.log > build-kernel.html && google-chrome build-kernel.html'

# flash full image
alias garf="sudo ./rkdeveloptool db external/cache/sources/rkbin-tools/rk35/rk3566_spl_loader_1.14.bin && sudo ./rkdeveloptool wl 0 output/images/Garv1_0.0.1_debian_bookworm_server_linux6.6.0-rc5/Garv1_0.0.1_debian_bookworm_server_linux6.6.0-rc5.img && sudo ./rkdeveloptool rd"

# -- Build image only
alias gari='sudo ./build.sh BOARD=garv1 BRANCH=current BUILD_OPT=image RELEASE=bookworm BUILD_MINIMAL=no BUILD_DESKTOP=no KERNEL_CONFIGURE=no COMPRESS_OUTPUTIMAGE=img CLEAN_LEVEL=none IGNORE_UPDATES=yes'

# build only uboot
alias garbu="sudo ./build.sh  BOARD=garv1 BRANCH=current BUILD_OPT=u-boot IGNORE_UPDATES=yes"

# flash only loader
alias garfu="sudo ./rkdeveloptool db external/cache/sources/rkbin-tools/rk35/rk3566_spl_loader_1.14.bin"

# build log
alias garbl="cat output/debug/compilation.log"

# reads device Id with rkdeveloptool
alias garrd="sudo ./rkdeveloptool rd"

# build and flash uboot & kernel only
alias garbfu="sudo ./build.sh  BOARD=garv1 BRANCH=current BUILD_OPT=u-boot IGNORE_UPDATES=yes && sudo rm -rf output/debs/u-boot/extracted_uboot && dpkg -x output/debs/u-boot/linux-u-boot-current-garv1_0.0.1_arm64.deb output/debs/u-boot/extracted_uboot && sudo ./rkdeveloptool db ../gar_gtw_build/external/cache/sources/rkbin-tools/rk35/rk3566_spl_loader_1.14.bin && sudo ./rkdeveloptool wl 0x4000 output/debs/u-boot/extracted_uboot/usr/lib/linux-u-boot-current-garv1_0.0.1_arm64/u-boot.itb && sudo ./rkdeveloptool rd"
alias garbfk="sudo ./update_kernel.sh"

# erase emmc
alias gare="sudo ./rkdeveloptool db ../gar_gtw_build/external/cache/sources/rkbin-tools/rk35/rk3566_spl_loader_1.14.bin && sudo ./rkdeveloptool wl 0 zero.img && sudo ./rkdeveloptool rd"




# --- CVB2 ---
# alias bb="bitbake cvb2-small"
# alias bbc="bitbake cvb2-small -c cleanall"
# alias bf="sudo /home/guilhermes/mfgtools/uuu/uuu -b emmc_all \
#  tmp/deploy/images/imx8qxp-cvb/imx-boot-imx8qxp-cvb-sd.bin-flash_spl \
#  tmp/deploy/images/imx8qxp-cvb/cvb2-small-imx8qxp-cvb.wic.zst"
#  alias bfu="sudo /home/guilhermes/mfgtools/uuu/uuu -b emmc \
#  tmp/deploy/images/imx8qxp-cvb/imx-boot-imx8qxp-cvb-sd.bin-flash_spl"
# alias cvb2="cd /media/guilhermes/ssd/CVB2/imx-yocto-bsp/ && source setup-environment build-wayland"
# alias bbmin="bitbake core-image-minimal"

# --- GSP ---
function deploy_kernel_gsp() {
    if [ -z "$1" ]; then
        echo "Usage: deploy_kernel_gsp <target_board_ip> [-r]"
        return 1
    fi

    TARGET_IP="$1"
    REBUILD=false

    # Check for rebuild flag
    if [ "$2" = "-r" ]; then
        REBUILD=true
    fi

    # Conditionally rebuild
    if $REBUILD; then
        echo "Rebuild requested: building the kernel..."
        sudo ./build.sh BOARD=gspv1 BRANCH=current BUILD_OPT=kernel \
            KERNEL_CONFIGURE=no IGNORE_UPDATES=yes
        if [ $? -ne 0 ]; then
            echo "Kernel build failed. Aborting deployment."
            return 1
        fi
    else
        echo "No rebuild flag passed; skipping build."
    fi

    # Define the output .deb file path
    DEB_FILE="output/debs/linux-image-current-gsp-rk356x_0.0.1_arm64.deb"
    if [ ! -f "$DEB_FILE" ]; then
        echo "Error: Kernel package '$DEB_FILE' not found."
        return 1
    fi

    # Copy the deb file to the target board
    echo "Copying $DEB_FILE to $TARGET_IP:/tmp ..."
    scp "$DEB_FILE" root@"$TARGET_IP":/tmp
    if [ $? -eq 0 ]; then
        echo "Deployment complete. On the target board, run update_kernel_deb.sh."
    else
        echo "SCP failed. Please check the target IP or network connectivity."
        return 1
    fi
}

alias gsp="cd /media/guilhermes/ssd/GSP/MAINLINE/gsp_gtw_build"
alias gsp-c="cd /media/guilhermes/ssd/GSP/connectedhomeip && pyenv local 3.12.4 && python --version"
alias gsp-m="cd /media/guilhermes/ssd/GSP/gsp-matter-controller && source ../gsp-matter-controller/python_env/bin/activate"

alias gsppixel="cd /media/guilhermes/ssd/GSP/Pixel-Repos"
alias gsps="cd /media/guilhermes/ssd/GSP/gsp_silabs_devices"
alias gspc="cd /media/guilhermes/ssd/GSP/SimplicityStudio-5/SimplicityStudio_v5/developer/adapter_packs/commander"

# Full build
alias gspb='sudo -E ./build.sh BOARD=gspv1 BRANCH=current BUILD_OPT=image RELEASE=bookworm BUILD_MINIMAL=no BUILD_DESKTOP=no KERNEL_CONFIGURE=no COMPRESS_OUTPUTIMAGE=img IGNORE_UPDATES=yes'
alias gspbc='sudo -E ./build.sh BOARD=gspv1 BRANCH=current BUILD_OPT=image RELEASE=bookworm BUILD_MINIMAL=no BUILD_DESKTOP=no KERNEL_CONFIGURE=no COMPRESS_OUTPUTIMAGE=img IGNORE_UPDATES=yes | tee build.log && ansi2html < build.log > build.html && google-chrome build.html'

# Kernel build only
alias gspbk='sudo ./build.sh BOARD=gspv1 BRANCH=current BUILD_OPT=kernel KERNEL_CONFIGURE=no IGNORE_UPDATES=yes'
alias gspbkc='sudo ./build.sh BOARD=gspv1 BRANCH=current BUILD_OPT=kernel KERNEL_CONFIGURE=no IGNORE_UPDATES=yes | tee build-kernel.log && ansi2html < build-kernel.log > build-kernel.html && google-chrome build-kernel.html'

# flash full image
alias gspf="sudo ./rkdeveloptool db external/cache/sources/rkbin-tools/rk35/rk3566_spl_loader_1.14.bin && sudo ./rkdeveloptool wl 0 output/images/Gspv1_0.0.1_debian_bookworm_server_linux6.6.0-rc5/Gspv1_0.0.1_debian_bookworm_server_linux6.6.0-rc5.img && sudo ./rkdeveloptool rd"

# -- Build image only
alias gspi='sudo ./build.sh BOARD=gspv1 BRANCH=current BUILD_OPT=image RELEASE=bookworm BUILD_MINIMAL=no BUILD_DESKTOP=no KERNEL_CONFIGURE=no COMPRESS_OUTPUTIMAGE=img CLEAN_LEVEL=none IGNORE_UPDATES=yes'

# build only uboot
alias gspbu="sudo ./build.sh  BOARD=gspv1 BRANCH=current BUILD_OPT=u-boot IGNORE_UPDATES=yes"

# flash only loader
alias gspfu="sudo ./rkdeveloptool db external/cache/sources/rkbin-tools/rk35/rk3566_spl_loader_1.14.bin"

# build log
alias gspbl="cat output/debug/compilation.log"

# reads device Id with rkdeveloptool
alias gsprd="sudo ./rkdeveloptool rd"

# build and flash uboot & kernel only
alias gspbfu="sudo ./build.sh  BOARD=gspv1 BRANCH=current BUILD_OPT=u-boot IGNORE_UPDATES=yes && sudo rm -rf output/debs/u-boot/extracted_uboot && dpkg -x output/debs/u-boot/linux-u-boot-current-gspv1_0.0.1_arm64.deb output/debs/u-boot/extracted_uboot && sudo ./rkdeveloptool db ../gsp_gtw_build/external/cache/sources/rkbin-tools/rk35/rk3566_spl_loader_1.14.bin && sudo ./rkdeveloptool wl 0x4000 output/debs/u-boot/extracted_uboot/usr/lib/linux-u-boot-current-gspv1_0.0.1_arm64/u-boot.itb && sudo ./rkdeveloptool rd"
alias gspbfk="sudo ./update_kernel.sh"

# erase emmc
alias gspe="sudo ./rkdeveloptool db ../gsp_gtw_build/external/cache/sources/rkbin-tools/rk35/rk3566_spl_loader_1.14.bin && sudo ./rkdeveloptool wl 0 zero.img && sudo ./rkdeveloptool rd"

alias gitpixel='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/pixelti'

alias c0="sshpass -p "pixel" scp /media/guilhermes/ssd/GSP/MAINLINE/gsp_gtw_build/userpatches/overlay/home/pixel/led_gw/gsp_stm32_flash.sh pixel@192.168.28.87:/home/pixel/led_gw"
alias cbin="sshpass -p "pixel" scp /media/guilhermes/ssd/GSP/gsp_signaling/GSP_MCU_LED/Debug/14-exemplo-matriz-rgb.bin pixel@192.168.28.87:/home/pixel/scripts/led-bin"
alias chex="sshpass -p "pixel" scp /media/guilhermes/ssd/GSP/gsp_signaling/GSP_MCU_LED/Debug/14-exemplo-matriz-rgb.hex pixel@192.168.28.87:/home/pixel/scripts/led-bin"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"




# # --- VOT ---
# alias vot="cd /media/guilhermes/ssd/VOT/vot_firmware_src"

# # --- IFF ---
# alias iff="cd /media/guilhermes/ssd/IFF"
# alias iffh="cd /home/guilhermes/Documents/ESPRESSIF/esp32s3/iff_firmware_src"
# alias iffg="rm -rf cplus_v0.0.1.bin && cp build/iff_firmware_src.bin cplus_v0.0.1.bin"

# # --- LIT2 ---
# alias lit2="cd /media/guilhermes/ssd/lit2/lit2_firmware_gateway_src"
# alias lit2kc="nvim kernel/arch/arm/configs/gateway_lit_dev_defconfig"
# alias lit2bc="nvim br2_external/configs/gateway_lit_dev_defconfig"
# alias lit2dts="nvim kernel/arch/arm/boot/dts/gateway_lit_dev-evb.dts"
# alias lit2bat="nvim kernel/drivers/power/rk816_battery.c"
# alias lb="./cqfd"
# alias lbk="./cqfd -b kernel"
# alias lbkm="./cqfd -b kernel && ./mkfirmware.sh"
# alias lbkmf="./cqfd -b kernel && ./mkfirmware.sh && sudo ./rkflash.sh boot"
# alias lbb="./cqfd -b buildroot"
# alias lbbm="./cqfd -b buildroot && ./mkfirmware.sh"
# alias lbbmf="./cqfd -b buildroot && ./mkfirmware.sh && sudo ./rkflash.sh rootfs"
# alias lf="sudo ./rkflash.sh"
# alias lfa="sudo ./rkflash.sh boot && sudo ./rkflash.sh rootfs && sudo ./rkflash.sh rd"
# alias lfk="sudo ./rkflash.sh boot && sudo ./rkflash.sh rd"
# alias lfb="sudo ./rkflash.sh rootfs && sudo ./rkflash.sh rd"
# alias lkm="make ARCH=arm gateway_lit_dev_defconfig menuconfig"
# alias lks="make ARCH=arm savedefconfig"
# alias lbu="./cqfd -b uboot && ./mkfirmware.sh"
# alias lfu="sudo ./rkflash.sh uboot && sudo ./rkflash.sh rd"

# # --- EMBRAER-SEE ---
# alias seesvn="cd /media/guilhermes/ssd/EMBRAER/SVN-Test"

# Networking stuff
alias ipv4='ip address | rg inet'

# pwd ready for scp
alias pwds="echo "$(whoami)@$(hostname -I | awk '{print $1}'):`pwd`""

# dmesg & journalctl stuff
alias dmf="dmesg --follow"
alias dm="dmesg | rg"
alias jm="journalctl | rg"

# ripgrep
alias rgd="rg -uu -g '*.dts' -g '*.dtsi'"   # for dtsi & dts files

# fzf & batcat
#alias ff="find * -type f | fzf"
#alias ff="rg --hidden -l "" | fzf"
# alias ff="fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}'"
#alias ff="find * -type f | rg"
#alias fz="find * -type f | fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}'"

alias fzfx='find . | fzf'

# fzf to find directories
alias fzfd='find . -type d -print | fzf --preview "tree -C {}" -e'
# alias fzfd='find . -type d -print | fzf'

alias cbat="batcat --style=numbers --color=always --line-range :500"

#saleae
alias saleae="sudo /media/guilhermes/ssd/Saleae/Logic-2.4.14-linux-x64.AppImage --no-sandbox"

#balena-etcher
alias balena="/media/guilhermes/ssd/Balena/balenaEtcher-linux-x64-2.1.0/balenaEtcher-linux-x64/balena-etcher"

#armbian
alias armbian="cd /media/guilhermes/ssd/GSP/ARMBIAN"

rgx() {
    local search_term="$1"
    local search_path="${2:-.}"  # Use second parameter or default to current directory
    
    if [ -z "$search_term" ]; then
        echo "Usage: rgx <search_term> [path]"
        return 1
    fi
    
    rg -uu -F "$search_term" "$search_path" --glob '!proc/*' --glob '!sys/*' --glob '!dev/*' "${@:3}"
}

function sshp {
    # Check if all required arguments were provided
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: sshp <user@host> <password>"
        return 1
    fi

    local CONNECTION_STRING="$1"
    local PASSWORD="$2"
    
    # 1. Extract the host (IP) part from the full connection string
    HOST_ONLY="${CONNECTION_STRING#*@}"

    # 2. Remove the old host key using the extracted HOST_ONLY (the IP address)
    echo "Attempting to remove old key for $HOST_ONLY from known_hosts..."
    # Suppress verbose ssh-keygen output
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "$HOST_ONLY" > /dev/null 2>&1

    # 3. Attempt the SSH connection, using sshpass for automated password entry
    echo "Connecting to $CONNECTION_STRING (accepting new key automatically)..."
    # The -p flag tells sshpass to read the password from the command line argument
    # We still use StrictHostKeyChecking=accept-new for the host key handling
    sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=accept-new "$CONNECTION_STRING"
}

# Super-finds
fx() {
    if [ "$#" -eq 2 ]; then
        # Two arguments provided: first is directory, second is name pattern
        find "$1" -name "*$2*"
    else
        # Only one argument provided: use root directory and the provided name pattern
        find / -name "*$1*"
    fi
}

sf() {
    sudo find / -path '/proc' -prune -o -path '/sys' -prune -o -path '/dev' -prune -o -name "*$1*" -print
}

# setting paths across userland
export PATH="$PATH:/opt/nvim"
export PATH=$PATH:/home/guilhermes/scripts
export PATH=$PATH:/media/guilhermes/ssd/AndroidStudio/android-studio-2024.1.2.12-linux/android-studio/bin
export PATH=$PATH:/media/guilhermes/ssd/GSP/SimplicityStudio-5/SimplicityStudio_v5/developer/adapter_packs/commander


export PROMPT_COMMAND="resize &>/dev/null; $PROMPT_COMMAND"

esp32h2() {
    export IDF_TOOLS_PATH=/media/guilhermes/ssd/GSP/ESPRESSIF
    export IDF_CCACHE_ENABLE=1
    source /media/guilhermes/ssd/GSP/ESPRESSIF/esp-idf/export.sh
    source /media/guilhermes/ssd/GSP/ESPRESSIF/esp-matter/export.sh
    idf.py set-target esp32h2
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Graphical Interface
alias o="xdg-open ."

# Highlight & pigmentize
alias c='pygmentize -g'
alias cats='highlight -O ansi --force'

# watch
alias wa="watch --color 'tree -C'"


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


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
