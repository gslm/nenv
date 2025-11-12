# nenv

A minimal environment setup script (`nenv.sh`) for new Linux boards. It installs common dev packages and idempotently updates `~/.bashrc` with useful aliases.

## One-Liner Execution

> **Note:** These commands pipe a remote script directly into `sudo bash`. Only run them if you trust this repository.

### Default (Install Packages & Update .bashrc)

```bash
curl -sSL [https://raw.githubusercontent.com/gslm/nenv/main/nenv.sh](https://raw.githubusercontent.com/gslm/nenv/main/nenv.sh) | sudo bash -s -- -b && source ~/.bashrc
```

Install Packages Only
```bash
curl -sSL [https://raw.githubusercontent.com/gslm/nenv/main/nenv.sh](https://raw.githubusercontent.com/gslm/nenv/main/nenv.sh) | sudo bash -s -- -i
```

Update .bashrc Only
```bash
curl -sSL [https://raw.githubusercontent.com/gslm/nenv/main/nenv.sh](https://raw.githubusercontent.com/gslm/nenv/main/nenv.sh) | sudo bash -s -- -b  && source ~/.bashrc
```

Show Help
```bash
curl -sSL [https://raw.githubusercontent.com/gslm/nenv/main/nenv.sh](https://raw.githubusercontent.com/gslm/nenv/main/nenv.sh) | bash -s -- -
```