# Dotfiles

A collection of my dotfiles and the scripts that they may use. Contains the following files.

- My very vanilla `.vimrc`.
- A work in progress `.tmux.conf`.
- A python script `now-playing.py` that finds out what song is playing on BBC Radio 6 Music. This script is used by `.tmux.conf` to display the current song on the status bar. (Currently not working.)
- A very simple `.screenrc` that is used for computers that might not have tmux on them.
- A simple `.inputrc` that makes for nicer autocomplete.

To setup, clone this repository, navigate into it, then run the following commands.

```
rsync . ~/ -a --exclude=.git --exclude=README.md
source ~/.tmux.conf
```

Whilst I like the slate colour scheme, it's nice to add a bit of colour. You can download the jellybeans colour scheme with the following.

```
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
```
