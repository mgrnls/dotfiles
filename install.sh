#!/bin/bash

rsync . ~/ -a --exclude=.git --exclude=README.md --exclude=install.sh
