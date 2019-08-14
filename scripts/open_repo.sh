#!/bin/sh
cat 'examples/repos.txt' | fzf | xargs open
