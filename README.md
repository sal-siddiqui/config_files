# config_files

## 📝 Project Overview

This repository contains my personal configuration files to help set up a consistent development environment across machines.

Included configuration files:

- [`settings.json`](./vscode/settings.json) – Visual Studio Code settings
- [`keybindings.json`](./vscode/keybindings.json) – Visual Studio Code keybindings
- [`.bash_prompt`](./linux/.bash_prompt) – Custom Bash prompt configuration
- [`Microsoft.PowerShell_profile.ps1`](./windows/Microsoft.PowerShell_profile.ps1) - PowerShell profile script

## ▶️ Usage

Follow the instructions below to apply these configurations on your system.

### PowerShell (Windows)

1. Open your `Documents` directory.
2. Create a folder named `MicrosoftPowerShell` if it already doesn't exist. (Note that this file may be hidden.)
3. Inside this folder, create a file named `Microsoft.PowerShell_profile.ps1`.
4. Copy the contents from this repository’s `Microsoft.PowerShell_profile.ps1` file into your new profile file.

### Bash Prompt (Git Bash)

1. In your home directory (`~`), create a file named `.bash_prompt`.
2. Copy the contents of the `.bash_prompt` file from this repository into it.
3. Open you `.bash_profile` or `.bashrc` file and add the following line:

```bash
source ~/.bash_prompt
```

### VSCode

**VSCode Settings & Keybindings**

1. Open VSCode and press `Ctrl + Shift + P`.
2. Search for "User Settings (JSON)" and open it.
3. Copy the contents of the `settings.json` file and paste it into your settings.
4. Next, search for "Keyboard Shortcuts (JSON)".
5. Copy the contents of the `keybindings.json` file and paste it into your keybindings configuration.

**Optional: Java Formatter**

If you use Java, you can apply Google’s Java style guide:

1. Download the `java-google-style-formatter.xml` file.
2. Move it to the following directory: `C:\Users\**<username>**\AppData\Roaming\Code\User`
3. In your `settings.json`, add or update the following lines:

   ```json
   "java.format.settings.url": "`C:\\Users\\**<username>**\\AppData\\Roaming\\Code\\User\\java-google-style-formatter.xml`",
   "java.format.settings.profile": "GoogleStyle"
   ```
