# claude --yolo

A simple wrapper for the Claude CLI that maps the `--yolo` flag to `--dangerously-skip-permissions`. It passes all other arguments and flags directly to the original `claude` executable.

## Installation

Run the 1-line installation script for your operating system.

### macOS & Linux (Bash / Zsh)

Open your terminal and run:

```bash
curl -sSL https://raw.githubusercontent.com/VocanicZ/claude---yolo/main/install.sh | bash

```

Restart your terminal or run `source ~/.bashrc` (or `source ~/.zshrc`) to apply the changes.

### Windows (PowerShell)

Open PowerShell and run:

```powershell
irm https://raw.githubusercontent.com/VocanicZ/claude---yolo/main/install.ps1 | iex

```

Restart your PowerShell window or run `. $PROFILE` to apply the changes.

## Usage

Use the `claude` command exactly as you normally would, but now you can use the `--yolo` flag to bypass permissions.

```bash
claude --yolo -m "Delete all log files in the temp directory"

```

The wrapper intercepts the command and runs:

```bash
claude --dangerously-skip-permissions -m "Delete all log files in the temp directory"

```
