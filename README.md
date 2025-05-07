# config_files

This repository contains my personal configuration files to help set up a consistent development environment across machines.

## 📝 Contents

- [`settings.json`](./settings.json) – VSCode settings
- [`keybindings.json`](./keybindings.json) – Custom VSCode keybindings
- [`.bash_prompt`](./.bash_prompt) – Customized Bash prompt setup
- [`Microsoft.PowerShell_profile.ps1`](./Microsoft.PowerShell_profile.ps1) - Customized Powershell prompt setup

## ▶️ Usage

To apply these configurations:

**VSCode Settings & Keybindings**

1. Open VSCode and press `Ctrl + Shift + P`.
2. Search for "User Settings (JSON)" and open it.
3. Copy the contents of the `settings.json` file and paste it into your settings.
4. Next, search for "Keyboard Shortcuts (JSON)".
5. Copy the contents of the `keybindings.json` file and paste it into your keybindings configuration.

**Bash Prompt**

1. Open your `.bashrc` or `.bash_profile` file.
2. Add the following line to source the `.bash_prompt` file:
   
   ```bash
   source /path/to/this/repo/.bash_prompt
   ```
   
**PowerShell**

1. Create a folder named `MicrosoftPowerShell` in your Documents directory.
2. Inside this folder, create a file named `Microsoft.PowerShell_profile.ps1`.
3. Copy the contents of the `Microsoft.PowerShell_profile.ps1` file into your new profile file.


## Notes

- These files reflect **my personal preferences**. Feel free to fork and adjust as needed.
- For syncing VSCode settings automatically, consider using the [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) extension.
