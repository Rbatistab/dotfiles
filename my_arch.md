Post install (as in your own wiki)

1. Login as root and update `pacman -Syu`
2. ZSH:
  - `pacman -S zsh`
  - `chsh $(which zsh)`
  - `usermod -s $(which zsh) root` (zsh to root's default)
3. [New user]():
    ```
    useradd -m -G wheel -s $(which zsh) <username> # (don't capitalize <username>, it's odd to read)
    sudo passwd --lock root # https://wiki.archlinux.org/title/Security#Restricting_root

    # Enforce delay afte failed login:
    sudo vim /etc/pacman.d/system-login
    # Add this line:
    #auth optional pam_faildelay.so delay=4000000

    ```
  - `-m`: give it a home
  - `-G wheel` add to wheel group
  - As root, modify `etc/sudoers` to uncomment this line and give sudo to the wheelers
  ```
  %wheel ALL=(ALL:ALL) ALL
  ```
4. Add the [microcode]():
  - `pacman -S amd-ucode` or `pacman -S intel-ucode`
  - Update grub: `grub-mkconfig -o /boot/grub/grub.cfg`
5. GUI:
  - We have 6 components:
    - Display servers: Framework to render GUIs:
      - Xorg: Traditional in linux, but more limited and vulnerable
      - Wayland: Modern succesor more capable. Carefull with legacy software. 
      - I chose Wayland. It is not shomething you install like an application but a display server protocol, as a communication interface between users and hardware. Can be provided by a desktop environment o a composer.
    - Display drivers:
      - Default drivers may not be enough in some cases, search for [AMD]() or [NVIDIA](). To know your GPU architecture run:
        - `lspci -nnk | grep -i "vga\|3d\|display" # for AMD and intel`
        - `nvidia-smi # for NVIDIA`
      - My case: Radeon RX Vega 6 -> AMDGPU -> `mesa`
        - `pacman -S mesa`
    - Desktop environments: A complete GUI beyond display servers. They bundle well integrated apps, like window managers, file managers, etc. 
      - [Link to a video]()
      - I'd chose [KDE]():
        ```
        sudo pacman -S plasma-meta plasma-wayland-session kde-applications-meta
        sudo pacman -S sddm # preferred for KDE
        sudo systemctl enable sddm.service
        ```
    - Window managers/compositors: Alternative to desktop environments that consume less resources
    - Display manager: Starts graphical environment and manages user logins
      - I chose SSDM because it's the best for KDE:
      ```
      pacman -S sddm
      sudo systemctl enable sddm.service
      ```
    - User directories: Defaults (Desktop, Download, etc)
      - If you use KDE, it does it for you, if not:
      ```
      `sudo pacman -S xdg-user-dirs` and run `xdg-user-dirs-update`
      ```
      ------- See the wiki of the package, there's a lot of env vars

# Building a Workflow

## Git and basic packages

```
sudo pacman -S git
sudo pacman -S ssh  # https://wiki.archlinux.org/title/OpenSSH
sudo pacman -S bat  # Bat - https://github.com/sharkdp/bat
sudo pacman -S exa  # exa - https://the.exa.website/
sudo pacman -S firefox-developer-edition
sudo pacman -S rsync
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # Rust - https://www.rust-lang.org/tools/install
```

Login with firefox here and set it as default browser. Then create keys for gh/gl and clone dotfiles and clone dotfiles and unix-automator

## Fix that awfull terminal

* Catppuchin theme
```
cd ~/Downloads
git clone https://github.com/catppuccin/konsole.git
cd konsole
sudo mv Catppuchin-* ~/usr/share/konsole/
```
* [Neovim](https://nvchad.com/docs/quickstart/install)
```
sudo pacman -S neovim
sudo pacman -S nerd-fonts # chose 40 45 50 (the whole package is huge)
sudo pacman -S ripgrep
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
* [oh-my-zsh](https://ohmyz.sh/)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
* [PowerLevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh)
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# add this to .zshrc (temporarily):
source .oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME="powerlevel10k/powerlevel10k"
```
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
* [tmux](https://github.com/tmux/tmux/wiki/Installing)
```
pacman -S tmux
```
* [tmux tpm](https://github.com/tmux-plugins/tpm)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
```
sudo pacman -S diff-so-fancy

git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
```
* [lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#arch-linux)
```
sudo pacman -S lazygit
```
* Copy the dotfiles and run the scripts
```
mkdir --p ~/Projects
cd ~/Projects/
git clone git@github.com:Rbatistab/dotfiles.git
export MY_SCRIPTS_DIR="${HOME}/scripts"
export DOTFILES_PACKAGE_DIR="${HOME}/Projects/dotfiles"
# Scripts:
source ${DOTFILES_PACKAGE_DIR}/scripts/scripts_updates.sh
scripts_package_to_local
# zsh:
source ${DOTFILES_PACKAGE_DIR}/scripts/zsh_updates.sh
zsh_package_to_local
# tmux:
source ${DOTFILES_PACKAGE_DIR}/scripts/tmux_updates.sh
tmux_package_to_local
# source:
source ~/.zshrc
tmux source ~/.tmux.conf
```

## Now let's pump nvim
[TBD]

# Some cleaning:

remove old .zshrc files


# KDE changes:
* Hide title bars:
    * Under `~/.config/kmixrc` add this:
    ```
    [Windows]
    BorderlessMaximizedWindows=true
    ```
* Make a [better desktop UX](https://www.youtube.com/watch?v=HuDlKH795XM&t=154s)
    ```
    yay -S latte-dock
    ```



# Utils

***Check [AUR](https://wiki.archlinux.org/title/Arch_User_Repository#Installing_and_upgrading_packages)***
* Telegram
```
sudo pacman -S telegram-desktop
```
* [Notion app](https://wiki.archlinux.org/title/Notion-app):
```
git clone https://aur.archlinux.org/notion-app-electron.git
cd notion-app-electron
makepkg -si notion-app-electron
```
* [Notion calendar](https://aur.archlinux.org/packages/notion-calendar-electron)
```
sudo snap install notion-calendar-snap
```
* [lazygit](https://github.com/jesseduffield/lazygit)
```
pacman -S lazygit
```
* [yay](https://aur.archlinux.org/packages/yay) (AUR)
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```
* [Freecad](https://wiki.freecad.org/Installing_on_Linux#Arch)
```
sudo pacman -S freecad
```

