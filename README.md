# Dotfiles
A collection of my dotfiles and the scripts that they may use. Contains:
- My very vanilla `.vimrc`.
- A work in progress `.tmux.conf`.
- A python script `now-playing.py` that finds out what song is playing on BBC Radio 6 Music. This script is used by `.tmux.conf` to display the current song on the status bar.

To setup, clone this repository to your home directory, then do
```
cp -R ~/dotfiles/ ~/
```
Although you may have to do
```
rm -rf ~/.git ~/README.md
```
assuming you don't have a `.git` folder or a `README.md` in your home directory. (Really need to figure out a better way of doing this.)
