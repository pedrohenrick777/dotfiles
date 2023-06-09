paru_apps=(
  'alacritty'
  'betterlockscreen'
  'bluez'
  'btop'
  'devour'
  'docker'
  'docker-compose'
  'dunst'
  'exa'
  'fd'
  'feh'
  'flatpak'
  'fzf'
  'htop'
  'kitty'
  'lazygit'
  'lightdm'
  'lightdm-gtk-greeter'
  'neovim'
  'nodejs'
  'noto-fonts'
  'noto-fonts-cjk'
  'noto-fonts-emoji'
  'mpv'
  'npm'
  'openssh'
  'pacman-contrib'
  'pamixer'
  'pavucontrol'
  'picom'
  'pipewire'
  'pipewire-jack'
  'pipewire-alsa'
  'pipewire-pulse'
  'python'
  'python-dbus-next'
  'python-iwlib'
  'python-pillow'
  'python-pip'
  'python-xlib'
  'qtile'
  'ranger'
  'ripgrep'
  'rofi'
  'rust'
  'starship'
  'tk'
  'tmux'
  'unzip'
  'xclip'
  'xdg-user-dirs'
  'xorg-apps'
  'xorg-server'
  'xdg-desktop-portal-gtk'
  'wget'
  'wireplumber'
  'zathura'
  'zathura-pdf-mupdf'
  'zip'
  'zoxide'
  'zsh'
)

flatpak_apps=(
  'com.bitwarden.desktop'
  'com.authy.Authy'
)

sudo -u $SCRIPT_USER paru -S --needed --noconfirm $(printf " %s" "${paru_apps[@]}")

flatpak install -y $(printf " %s" "${flatpak_apps[@]}")
