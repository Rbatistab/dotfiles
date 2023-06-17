# My configs:

*Heads up*: **This package should better go to `~/Projects/dotfiles` unless you want to modify the dir paths for the scripts**

### Don't forget to do this(will mess the scripts and aliases if you do):

```
export MY_SCRIPTS_DIR="${HOME}/scripts"
export DOTFILES_PACKAGE_DIR="${HOME}/Projects/dotfiles"
```

### Zsh

#### Copy all the zsh files from local to package and viceversa?


```
source_zsh_updates # source the zsh updates scripts if already in local
source ${DOTFILES_PACKAGE_DIR}/scripts/zsh_updates.sh # source the same but from package
```
* `backup_zsh`: Backup zsh config to `~/zsh-backup/`
* `zsh_package_to_local`: Copy(override) files from package to local
* `zsh_local_to_package`: Copy(override) files from local to package
* `clean_zsh_backups`: Clean `~/zsh-backup`

Also create `zshrc/noGit/foo/Config` dirs to have anything that you could use local but don't want in a public package

### NvChad

#### NvChad from local config to package?

```
source_nvchad_updates # source the nvchad updates scripts if already in local
source ${DOTFILES_PACKAGE_DIR}/scripts/nvchad_updates.sh # source the same but from package
```
* `nvchad_package_to_local`: Copy(override) files from package to local
* `nvchad_local_to_package`: Copy(override) files from local to package

#### Scripts from package config to local?

```
source_scripts_updates # source the script updates scripts if already in local
source ${DOTFILES_PACKAGE_DIR}/scripts/scripts_updates.sh # source the same but from package
```
* `scripts_package_to_local`: Copy(override) files from package to local
* `scripts_local_to_package`: Copy(override) files from local to package


## vimrc
[TBD]

## tmux

1. Copy file `.tmux.conf` to HOME

Check these if you see any trouble:
* https://github.com/romkatv/powerlevel10k/issues/1656
* https://github.com/tmux/tmux/wiki/Installing
