#!/bin/bash

###############################################################################
#                               NvChad updates                                #
###############################################################################

###############################################################################
# Updates from local nvChad to dotfiles package and viceversa
###############################################################################

PACKAGE_NVCHAD_DIR="${DOTFILES_PACKAGE_DIR}/config/nvim/nvchad-custom"
LOCAL_NVCHAD_DIR="${HOME}/.config/nvim/lua/custom"

nvchad_package_to_local() {
  echo "Copying files from package to local..."
  cp -r ${PACKAGE_NVCHAD_DIR}/* ${LOCAL_NVCHAD_DIR}
  echo "Done!"
}

nvchad_local_to_package() {
  echo "Copying files from local to package..."
  cp -r ${LOCAL_NVCHAD_DIR}/* ${PACKAGE_NVCHAD_DIR}
  echo "Done!"
}


