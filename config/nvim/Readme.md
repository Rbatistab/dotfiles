# Nvim config:

## For NvChad
1. Follow the [installation guides](https://nvchad.com/docs/quickstart/install)
1. Install lldb by running `sudo apt install lldb`
1. Copy the customs dir, run form the same folder as this readme:
```
cp -r nvchad-custom/* ~/.config/nvim/lua/custom/
```
1. Close and open again and run `:MasonInstallAll`

## For old config
1. Copy the files to nvim config, run from this dir:
```
cp -r old-config/* ~/.config/nvim/
```
1. Install [vim-plug](https://github.com/junegunn/vim-plug)
1. Install the pluggins by running `:PlugInstall`
