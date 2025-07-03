# The Files of the Dot

Uses GNU Stow as the linker of syms

## Arch Setup

- Install Arch linux w/ archinstall
    * Remember disk encryption
- Reboot
- Install packages:
  ```
  sudo pacman -S xorg-server xorg-xinit xorg-xinput \
                 nvim git brightnessctl stow \
                 libxft libxinerama \
                 zsh zoxide starship unzip bat fzf
                 ghostty lazygit openssh
  ```
- Change brightness: `brightnessctl set 100%`
- Clone dotfiles: git clone
- Clone dwm: git clone
- From dwm directory: `sudo make clean install`
- From dotfiles directory:
    * `stow xorg`
    * `stow zsh`
    * `stow lazygit`
    * `stow ghostty`
- Install fnm: `curl -fsSL https://fnm.vercel.app/install | bash`
- Oh My Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
    * Zsh Autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions`
    * Zsh Syntax Highlighting: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting`
- Install yay: `git clone https://aur.archlinux.org/yay.git ~/.local/src/yay`
    * Within yay directory: `makepkg -si`
- Install 1password: `yay -S 1password`

## Xorg

- `sudo pacman -S xorg-server xorg-xinit xorg-xinput`

## ZSH

- Create the `~/.cache/zsh` folder
- `git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions`
- `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting`
