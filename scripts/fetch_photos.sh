#!/bin/sh
for i in $(seq 1 "$1"); do
  echo "Downloading image $i"
  curl -s "https://placeimg.com/640/480/animals" > "animal-$i.jpg"
done
