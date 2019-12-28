# Dotfiles
A collection of my dotfiles and the scripts that they may use. Contains:
- My very vanilla `.vimrc`.
- A work in progress `.tmux.conf`.
- A python script `now-playing.py` that finds out what song is playing on BBC Radio 6 Music. This script is used by `.tmux.conf` to display the current song on the status bar.

To setup, clone this repository, navigate into it, then run the following commands.
```
rsync . ~/ -a --exclude=.git --exclude=README.md
source ~/.tmux.conf
```
