#!/bin/bash

###############################################################################
#                               Script updates                                #
###############################################################################

###############################################################################
# Updates from local scripts to dotfiles package and viceversa
###############################################################################

PACKAGE_SCRIPTS_DIR="${DOTFILES_PACKAGE_DIR}/scripts"

scripts_package_to_local() {
  mkdir -p ${MY_SCRIPTS_DIR}
  echo "Copying files from package to local..."
  rsync -a --delete ${PACKAGE_SCRIPTS_DIR}/ ${MY_SCRIPTS_DIR}
  echo "Done!"
}

scripts_local_to_package() {
  echo "Copying files from local to package..."
  rsync -a --delete ${MY_SCRIPTS_DIR}/ ${PACKAGE_SCRIPTS_DIR}
  echo "Done!"
}

