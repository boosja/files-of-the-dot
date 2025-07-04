# The Files of the Dot

Uses GNU Stow as the linker of syms

## Arch Setup

- Install Arch linux w/ archinstall
    * Remember disk encryption
- Reboot
- Install all packages (or per sections below):
  ```
  sudo pacman -S xorg-server xorg-xinit xorg-xinput \
                 nvim git brightnessctl stow \
                 libxft libxinerama \
                 zsh zoxide starship unzip bat fzf \
                 ghostty lazygit openssh qutebrowser
  ```

### Preliminary items

`sudo pacman -S git nvim brightnessctl bat`

_Change brightness: `brightnessctl set 100%`_

### yay

- `git clone https://aur.archlinux.org/yay.git ~/.local/src/yay`
- `cd ~/.local/src/yay && makepkg -si`

### 1password

- `yay -S 1password`
- `sudo pacman -S openssh`
- Activate 1password ssh agent
- Append this to `~/.ssh/config`:
  ```
  Host *
    IdentityAgent ~/.1password/agent.sock
  ```

Now 1password handles the ssh connection to github (and others)

### Dotfiles

- `git clone git@github.com:boosja/files-of-the-dot.git ~/dotfiles`
- `sudo pacman -S stow`

### ZSH

- `sudo pacman -S zsh zoxide starship unzip fzf`
- Oh My Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
    * Create the `~/.cache/zsh` folder
    * Zsh Autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions`
    * Zsh Syntax Highlighting: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting`
    * DELETE THE ohmyzsh .zshrc-FILE!
- `stow -d ~/dotfiles zsh`
- Install fnm (Fast Node Manager):
  `curl -fsSL https://fnm.vercel.app/install | bash`

### lazygit

- `sudo pacman -S lazygit`
- `stow -d ~/dotfiles lazygit`

### Ghostty

- `sudo pacman -S ghostty`
- `stow -d ~/dotfiles ghostty`

### Xorg

- `sudo pacman -S xorg-server xorg-xinit xorg-xinput`
- `stow -d ~/dotfiles xorg`

### dwm

- `sudo pacman -S libxft libxinerama`
- `git clone git@github.com:boosja/dwm.git ~/.local/src/dwm`
- `cd ~/.local/src/dwm && sudo make clean install`

### qutebrowser

- `sudo pacman -S qutebrowser`
- `stow -d ~/dotfiles qutebrowser`

