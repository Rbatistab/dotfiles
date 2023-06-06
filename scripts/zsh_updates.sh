#!/bin/bash

###############################################################################
#                               zsh updates                                   #
###############################################################################

###############################################################################
# Updates from local zsh to dotfiles package and viceversa
###############################################################################

LOCAL_ZSHRC_DIR="${HOME}/zshrc"
PACKAGE_ZSHRC_DIR="${DOTFILES_PACKAGE_DIR}/zsh/zshrc"
LOCAL_ZSHRC_FILE="${HOME}/.zshrc"
PACKAGE_ZSHRC_FILE="${DOTFILES_PACKAGE_DIR}/zsh/.zshrc"
ZSH_BACKUP_DIR="${HOME}/zsh-backup"

backup_zsh() {
  CURRENT_BACKUP=${ZSH_BACKUP_DIR}/$(date '+%Y-%m-%d_%H:%M:%S')
  mkdir -p ${CURRENT_BACKUP}
  cp ${LOCAL_ZSHRC_FILE} ${CURRENT_BACKUP}/.zshrc
  cp -r ${LOCAL_ZSHRC_DIR} ${CURRENT_BACKUP}/
}

zsh_package_to_local() {
  echo "Backing up current zsh files..."
  backup_zsh
  mkdir -p ${LOCAL_ZSHRC_DIR}
  echo "Copying files from package to local..."
  cp -r ${PACKAGE_ZSHRC_DIR}/* ${LOCAL_ZSHRC_DIR}/
  cp -r ${PACKAGE_ZSHRC_FILE} ${LOCAL_ZSHRC_FILE} 
  echo "Done!"
}

zsh_local_to_package() {
  echo "Copying files from local to package..."
  cp -r ${LOCAL_ZSHRC_DIR}/* ${PACKAGE_ZSHRC_DIR}
  cp -r ${LOCAL_ZSHRC_FILE} ${PACKAGE_ZSHRC_FILE}
  echo "Done!"
}

clean_zsh_backups() {
  rm -rf ${ZSH_BACKUP_DIR}
}
