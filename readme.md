# Timov

## Installation

```sh
curl https://raw.githubusercontent.com/jliocsar/timov/refs/heads/main/install.sh | sh
```

```sh
# In your .bashrc or .zshrc file
alias notes="code $HOME/.timov"
```

## How it works

The Timov installer will create a cronjob entry, making the Timov main file run every 2 minutes.

The main file will then pull the latest changes from `git` and commit/push any pending changes (will also commit/push the conflicts if any).

Essentially your `.timov` directory will be the mirror of your remote directory in your `git` repository with your notes. Any change made in the local repository will be reflected in the remote when picked up by the cron.
