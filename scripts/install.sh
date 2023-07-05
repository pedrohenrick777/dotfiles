#!/bin/bash

GIT_URL=https://raw.githubusercontent.com/pedrohenrick777/dotfiles
source <(curl -fsSl $GIT_URL/main/scripts/envs.sh)

function verify_root_user() {
  if [ `whoami` != 'root' ];then
    echo 'É preciso rodar o script com permissão de root.'
    exit 1
  fi
}

function install_paru() {
  git clone https://aur.archlinux.org/paru-bin.git $HOME/paru
  cd ~/paru
  makepkg --noconfirm -si
  cd $HOME
  rm -rf $HOME/paru
}

function reboot_question() {
  echo -e "\nReiniciar o sistema agora? [S/N] "
  read reiniciar

  case $reiniciar in
    y*|Y*|s*|S*) reboot ;;
    *) exit 0 ;;
  esac
}

function post_apps_installation() {
  $SCRIPTS_PATH/config.sh

  xdg-user-dirs-update

  chsh -s /bin/zsh

  sudo systemctl enable docker.service
  sudo systemctl enable lightdm.service
  systemctl enable --user pipewire.service

  sudo usermod -aG docker $USER
}

function main() {
  verify_root_user

  git clone https://github.com/pedrohenrick777/dotfiles.git $DOTFILES_PATH
  
  sudo pacman -Sy

  install_paru

  $SCRIPTS_PATH/apps.sh
  
  post_apps_installation
  
  reboot_question
}
