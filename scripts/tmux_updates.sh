#!/bin/bash

###############################################################################
#                                tmux updates                                 #
###############################################################################

###############################################################################
# Updates from local tmux to dotfiles package and viceversa
###############################################################################

PACKAGE_TMUX_FILE="${DOTFILES_PACKAGE_DIR}/.tmux.conf"
LOCAL_TMUX_FILE="${HOME}/.tmux.conf"

tmux_package_to_local() {
  echo "Copying files from package to local..."
  rm ${LOCAL_TMUX_FILE}
  cp ${PACKAGE_TMUX_FILE} ${LOCAL_TMUX_FILE}
  echo "Done!"
}

tmux_local_to_package() {
  echo "Copying files from local to package..."
  rm ${PACKAGE_TMUX_FILE}
  cp ${LOCAL_TMUX_FILE} ${PACKAGE_TMUX_FILE}
  echo "Done!"
}



