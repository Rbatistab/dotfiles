#!/bin/bash

###############################################################################
#                               zsh updates                                   #
###############################################################################

###############################################################################
# Updates from local zsh to dotfiles package and viceversa
###############################################################################

# zsh config files
LOCAL_ZSHRC_FILE="${HOME}/.zshrc"
PACKAGE_ZSHRC_FILE="${DOTFILES_PACKAGE_DIR}/zsh/.zshrc"
LOCAL_ZSHRC_DIR="${HOME}/zshrc"
PACKAGE_ZSHRC_DIR="${DOTFILES_PACKAGE_DIR}/zsh/zshrc"
ZSH_BACKUP_DIR="${HOME}/zsh-backup"

# Backup current zsh config
backup_zsh() {
  CURRENT_BACKUP=${ZSH_BACKUP_DIR}/$(date '+%Y-%m-%d_%H:%M:%S')
  mkdir -p ${CURRENT_BACKUP}
  cp ${LOCAL_ZSHRC_FILE} ${CURRENT_BACKUP}/.zshrc
  cp -r ${LOCAL_ZSHRC_DIR} ${CURRENT_BACKUP}/
}

# Send everything in the package to local
zsh_package_to_local() {
  echo "Backing up current zsh files..."
  backup_zsh

  echo "Copying '.zshrc' file..."
  cp -r ${PACKAGE_ZSHRC_FILE} ${LOCAL_ZSHRC_FILE} 
  echo "Copying files from package to local..."
  mkdir -p ${LOCAL_ZSHRC_DIR}
  rsync -a --delete ${PACKAGE_ZSHRC_DIR}/ ${LOCAL_ZSHRC_DIR}

  echo "Done!"
}

# Send everything in the package to local
zsh_local_to_package() {
  echo "Copying '.zshrc' file..."
  cp ${LOCAL_ZSHRC_FILE} ${PACKAGE_ZSHRC_FILE}

  echo "Copying files from local to package..."
  rsync -a --delete ${LOCAL_ZSHRC_DIR}/ ${PACKAGE_ZSHRC_DIR}

  echo "Done!"
}

# Clean backup files
clean_zsh_backups() {
  rm -rf ${ZSH_BACKUP_DIR}
}
