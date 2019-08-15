#!/bin/sh

RAN=""

if [ ! $1 ]; then
  echo "Nothing specified."
  exit 1
fi

if [ $1 == "users" ]; then
  curl -s "https://jsonplaceholder.typicode.com/users"
  RAN=true
fi

if [ $1 == "user" ]; then
  curl -s "https://jsonplaceholder.typicode.com/users/$2"
  RAN=true
fi

if [ $1 == "posts" ]; then
  curl -s "https://jsonplaceholder.typicode.com/posts"
  RAN=true
fi

if [ ! $RAN ]; then
  echo "Could not find command '$1'"
fi
