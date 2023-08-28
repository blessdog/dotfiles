# config_files

 ### _Moving to a new computer and setting up your development environment can be a breeze with the right steps. Here's a guide to help you transfer your dotfiles and configurations from one machine to another:_



# 1. Clone Your Dotfiles Repository:
On your new computer, open the terminal and navigate to your home directory or the location you'd like to clone your dotfiles.
```bash
cd ~
```
Clone your dotfiles repository:
```bash
git clone https://github.com/your_username/your_dotfiles_repo.git
```
#2. Create Symlinks:
Remember the script you wrote to create symbolic links? You can now run it on your new computer. Ensure that the script is executable:
```bash
chmod +x /path/to/your/symlink_script.sh
```
Run the script:
```bash
/path/to/your/symlink_script.sh
```
This will create symlinks in your home directory, pointing to the configurations in your dotfiles repository.
#3. Setup iTerm2:
If you've saved iTerm2 profiles and configurations, those are typically stored in the ~/Library/Preferences/com.googlecode.iterm2.plist file. If you have version-controlled this file, you'd replace the one on your new machine with your backed-up one.

You might also need to install any custom iTerm2 themes or fonts you were using on your old machine.
# 4. Setup zsh and oh-my-zsh (If you use it):
If you haven't installed zsh and oh-my-zsh on your new computer:

Install zsh:
```bash
# On macOS:
brew install zsh

# On Debian/Ubuntu:
sudo apt-get install zsh

# On Fedora:
sudo dnf install zsh
```
Install `oh-my-zsh`:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
If you have custom oh-my-zsh themes or plugins, make sure to copy or clone them into the appropriate directories (~/.oh-my-zsh/themes/ or ~/.oh-my-zsh/plugins/).
# 5. Additional Configurations:
**Vim/NeoVim:** If you have configurations for Vim or NeoVim, they might need some plugins to be installed or additional steps to be functional. Ensure you install any required plugins or tools.
**SSH:** If you have SSH configurations and keys, ensure that they are set up and have the correct permissions (e.g., ~/.ssh/id_rsa should have 600 permissions).
**Software and Tools:** Ensure that you've installed all the tools, software, and languages you use (e.g., Node.js, Python, Docker). Package managers like brew (for macOS) can make this process faster.
**Aliases and Functions:** If you've set up custom aliases or functions in your .zshrc or .bashrc, they should now be available on your new machine. Check if they are working as expected.
# 6. Test:
Open new terminal windows and tabs to ensure that your settings, themes, and configurations load correctly. Test out any aliases, custom functions, or shortcuts to make sure they work.

And that's it! With these steps, you should have a familiar development setup on your new machine.

