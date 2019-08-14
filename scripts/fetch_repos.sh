#!/bin/sh
curl -s https://raw.githubusercontent.com/sindresorhus/awesome-nodejs/master/readme.md \
  | grep -o 'https://github.com/[^ ]*' \
  | sed 's|)$||'
