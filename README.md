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
                 ghostty lazygit openssh qutebrowser \
                 ttf-firacode-nerd ttf-inconsolata-nerd otf-opendyslexic-nerd \
                 jq
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

### EWW (topbar)

- Install rust: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- Follow instructions in EWW documentation
- Install Nerd Font: `sudo pacman -S ttf-inconsolata-nerd`
- Install wireless tools: `sudo pacman -S wireless_tools`


## Qualcomm® Wi-Fi 7 NCM825

Thinkpad T14 Gen 5

This is with Omarchy (if that makes a difference).
Before anything else, try: 
```
# /etc/iwd/main.conf
[General]
EnableNetworkConfiguration=true
ControlPortOverNL80211=false
```

If that does not work, try this too (in addition to the above):
```
# Extract the current compressed firmware files
cd /lib/firmware/ath12k/WCN7850/hw2.0/
sudo zstd -d *.zst

# Verify they extracted
ls -la *.bin

# Now let's get the updated firmware that fixes the known issues
cd /tmp
git clone https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware.git

# Backup current firmware
sudo cp -r /lib/firmware/ath12k/WCN7850 /lib/firmware/ath12k/WCN7850.backup

# Copy the newer stable firmware
sudo cp ath12k-firmware/WCN7850/hw2.0/1.0.c5/WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3/amss.bin /lib/firmware/ath12k/WCN7850/hw2.0/
sudo cp ath12k-firmware/WCN7850/hw2.0/1.0.c5/WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3/m3.bin /lib/firmware/ath12k/WCN7850/hw2.0/

# Make sure board-2.bin exists (uncompressed)
sudo cp ath12k-firmware/WCN7850/hw2.0/board-2.bin /lib/firmware/ath12k/WCN7850/hw2.0/

# Unload the module
sudo modprobe -r ath12k_pci
sudo modprobe -r ath12k

# Clear the kernel ring buffer to see fresh messages
sudo dmesg -C

# Reload the module
sudo modprobe ath12k_pci
sudo modprobe ath12k

# Check the initialization messages
sudo dmesg | head -30
```
