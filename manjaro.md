# Manjaro

## Install from ISO

## Update System

Needs some things:
```bash
# update mirrors
sudo pacman-mirrors -f0

# update pgp keys
sudo pacman-key --populate archlinux manjaro
sudo pacman-key --refresh-keys

# update system
sudo pacman -Syyu

# restart system
systemctl reboot
```

## Deactivate Hardware Speaker

```
# only necessary on laptops and weird towers
rmmod pcspkr

sudo ln -s $CONFIGS/modprobe.d/nobeep.conf /etc/modprobe.d/nobeep.conf
```

## Enable AUR

- open pamac
- go to Settings -> Preferences
- set "enable AUR" to true

## Install browser of choice

- get access to
  - 1password
  - mails
  - slack
  - etc

## Add SSH keys and config from secure drive

## Setup file structure

- ~
  - querbeet
    - stuff
    - workspace
      - configs
      - tools (for optional custom scripts that should be in the PATH)
  - workspace -> ./querbeet/workspace

## Setup Development Tools

### Clone Configs

- clone from https://github.com/yeldiRium/configs to ~/querbeet/workspace/configs
- create `~/system_config.sh` and set `$CONFIG_DIR` to `~/querbeet/workspace/configs`
- `touch ~/.secret`
- symlink i3config `ln -s $CONFIG_DIR/i3_config ~/.i3/config`
  - and i3status config `ln -s $CONFIG_DIR/i3status_config ~/.config/i3status/config`
  - optionall put a lockscreen wallpaper into `~/querbeet/gfx/wallpaper/lockscreen.png`
- `ln -s $CONFIG_DIR/.gitignore ~/.gitignore`
  - `git config --global core.excludesfile ~/.gitignore`
- `ln -s $CONFIG_DIR/.configs/mimeapps.list ~/.configs/mimeapps.list` (overwrite existing)
- `ln -s $CONFIG_DIR/.gnupg/gpg.conf ~/.gnupg/gpg.conf`

### Setup ZSH

- install `zsh`, `zsh-completions` and `zsh-syntax-highlighting` from manjaro repo
- install `oh-my-zsh`
  - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

- https://forum.manjaro.org/t/how-to-setup-oh-my-zsh-in-manjaro/34519
- symlink `$CONFIG_DIR/zsh/.zshrc` and `$CONFIG_DIR/zsh/.zshenv` and adjust them
- create warp points
  - querbeet
  - workspace
  - configs
  - stuff

### Setup Git configuration

- user.name
- user.email

### HSTR

https://github.com/dvorka/hstr

### thefuck

https://github.com/nvbn/thefuck

- install python-pip via pamac
- `sudo pip install thefuck`

### NVM

- install nvm from AUR
- install relevant node versions

This is later loaded in .zshrc

### RVM

https://rvm.io/

manual installation

This is later loaded in .zshrc

### JDK

`jdk-openjdk` via official repositories

### docker & docker-compose

- install from manjaro repositories
- add self to docker group (`sudo usermod -a -G docker $USER`)
- allow docker group sudo-less docker usage:

```
> sudo visudo

# add line to end of file:
%docker ALL=NOPASSWD: /usr/bin/docker
```

### kubectl

- install from manjaro repositories

## URXVT

- install `resize-font` extension from https://github.com/simmel/urxvt-resize-font/ to ~/.urxvt/ext

## Emacs

- install from manjaro repo
- `ls -s $CONFIGS/.emacs.d/init.el ~/.emacs.d/init.el`
- maybe adjust the path in `init.el`, probably not
- start emacs
- install all packages (`Alt+x package-install <name>`)

## Install various programs

- chrome
- firefox
- tor

## Install and configure VSCode

install visual-studio-code-bin from AUR, then

```
# symlink keybindings
ln -s $CONFIGS/vscode_keybindings.json ~/.config/Code/User/keybindings.json
# symlink settings
ln -s $CONFIGS/vscode_settings.json ~/.config/Code/User/settings.json
```

## Install and configure Atom

- install atom
- symlink keymap (`ln -s $CONFIGS/.atom/keymap.cson ~/.atom/keymap.cson`)

## install pulseaudio

from official repos:

- pulseaudio
- pulseaudio-alsa
- pulseaudio-bluetooth
