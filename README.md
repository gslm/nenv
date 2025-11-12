# nenv

A minimal environment setup script (`nenv.sh`) for new Linux boards. It installs common development packages and idempotently updates `~/.bashrc` with useful aliases.

The script is designed to be run on new systems and is safe to re-run. It automatically finds the calling user's `.bashrc` file when run with `sudo`.

## 🚀 One-Liner Execution

> **Security Warning:** These commands pipe a script from the internet directly into `sudo bash`. This is a potential security risk. Only run these commands if you fully trust this repository.
>
> **Note:** The "Copy" button on the code blocks below will work correctly.

---

### Default (Install Packages & Update .bashrc)

Runs both the package installer and the `.bashrc` update, then **immediately loads** the new aliases into your shell.

```bash
curl -sSL [https://raw.githubusercontent.com/gslm/nenv/main/nenv.sh](https://raw.githubusercontent.com/gslm/nenv/main/nenv.sh) | sudo bash -s -- && source ~/.bashrc