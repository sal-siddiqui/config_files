# 🛠️ Personal Configuration Files

This repository contains my personal configuration files to help set up a consistent development environment across machines.

## Contents

- [`settings.json`](./settings.json) – VSCode settings
- [`keybindings.json`](./keybindings.json) – Custom VSCode keybindings
- [`.bash_prompt`](./.bash_prompt) – Customized Bash prompt setup

## Usage

To apply these configurations:

1. **VSCode Settings & Keybindings**
   - Copy `settings.json` and `keybindings.json` to your VSCode user settings directory:
     - macOS: `~/Library/Application Support/Code/User/`
     - Linux: `~/.config/Code/User/`
     - Windows: `%APPDATA%\Code\User\`

2. **Bash Prompt**
   - Source the `.bash_prompt` file from your `.bashrc` or `.bash_profile`:
     ```bash
     source /path/to/this/repo/.bash_prompt
     ```

## Notes

- These files reflect **my personal preferences**. Feel free to fork and adjust as needed.
- For syncing VSCode settings automatically, consider using the [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) extension.
