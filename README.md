# Dotfiles

A collection of my dotfiles and the scripts that they may use. Contains the following files.

- My very vanilla `.vimrc`.
- My `.vim` folder, that contains all the kdb+/q syntax highlighting, as well as a nice colour scheme.
- A work in progress `.tmux.conf`.
- A python script `now-playing.py` that finds out what song is playing on BBC Radio 6 Music. This script is used by `.tmux.conf` to display the current song on the status bar. (Currently not working.)
- A very simple `.screenrc` that is used for computers that might not have tmux on them. (Though this doesn't get used, like, at all.)
- A simple `.inputrc` that makes for nicer autocomplete.

To setup, clone this repository, navigate into it, then run the following command.

```
. install.sh
```
