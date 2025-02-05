#!/bin/bash

###############################################################################
#                       Neovim and vim updates                                #
###############################################################################

###############################################################################
# Updates from local neovim and vim to dotfiles package and viceversa
###############################################################################

PACKAGE_VIMRC_FILE="${DOTFILES_PACKAGE_DIR}/.vimrc"
LOCAL_VIMRC_FILE="${HOME}/.vimrc"
PACKAGE_IDEAVIMRC_FILE="${DOTFILES_PACKAGE_DIR}/.ideavimrc"
LOCAL_IDEAVIMRC_FILE="${HOME}/.ideavimrc"
PACKAGE_NVCHAD_DIR="${DOTFILES_PACKAGE_DIR}/config/nvim/nvchad-custom"
LOCAL_NVCHAD_DIR="${HOME}/.config/nvim/lua/custom"

neovim_and_vim_package_to_local() {
  echo "Copying '.vimrc' file..."
  cp -r ${PACKAGE_VIMRC_FILE} ${LOCAL_VIMRC_FILE} 

  echo "Copying '.ideavimrc' file..."
  cp -r ${PACKAGE_IDEAVIMRC_FILE} ${LOCAL_IDEAVIMRC_FILE} 

  echo "Copying nvchad files from package to local..."
  rsync -a --delete ${PACKAGE_NVCHAD_DIR}/ ${LOCAL_NVCHAD_DIR}
  echo "Done!"
}

neovim_and_vim_local_to_package() {
  echo "Copying '.vimrc' file..."
  cp -r ${LOCAL_VIMRC_FILE} ${PACKAGE_VIMRC_FILE} 

  echo "Copying '.ideavimrc' file..."
  cp -r ${LOCAL_IDEAVIMRC_FILE} ${PACKAGE_IDEAVIMRC_FILE} 

  echo "Copying nvchad files from local to package..."
  rsync -a --delete ${LOCAL_NVCHAD_DIR}/ ${PACKAGE_NVCHAD_DIR}
  echo "Done!"
}


