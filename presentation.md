---
title: 'More Productive and More Fun'
author: 'Drew Hodson'
patat:
  wrap: true
  margins:
    left: 1
    right: 1
...

```

         oooo                  oooo  oooo  
         `888                  `888  `888  
 .oooo.o  888 .oo.    .ooooo.   888   888  
d88(  "8  888P"Y88b  d88' `88b  888   888  
`"Y88b.   888   888  888ooo888  888   888  
o.  )88b  888   888  888    .o  888   888  
8""888P' o888o o888o `Y8bod8P' o888o o888o 
                                           
                                           
                                           
```

# More Productive and More Fun
## Automate it with Shell Scripts

Drew Hodson

---

# About Me

- On the Cirrus team at Eli Lilly
- DMIer for 10 months
- Shell scripter for two years

---

# Motivation

I've always been a big fan of automating tasks.

. . .

Staying D.R.Y. 

<!-- Since you can do almost anything you can do on your computer in a shell script or via the terminal, if you do perform a task in this manner, you can apply the DRY principle to anything you do in your workday. -->

. . .

I want to focus on what's cool.

<!-- The idea behind this talk changed a few times. At first, I wanted to explain everything you could possibly do with Shell scripts, but the topic is far too big for that. I can't really give an entire programming language tutorial in the timespan of one talk. So instead, I'm going to go over some cool examples and some things that I use in my day to day work. Hopefully, it will pique your interest in using the terminal and get you to investigate some of the things that I'm discussing today. -->

---

# What Can I Do With The Terminal?

You may not be aware of what your terminal is capable of.

. . .

You can run a presentation.

. . .

You can check your calendar:

```sh
cal
```

. . .

You can get the weather in your terminal:

```sh
curl wttr.in
```

---

# CURL and the Unix Philosophy

The previous example, `curl wttr.in`, uses a program called `curl`.

<!-- Show curl on http://www.google.com. Curl is a program with a singular purpose, to make HTTP requests and show you the content of the page. -->

. . .

`curl` is a great example of the Unix philosophy.

. . .

*The Unix Philosophy*

- A program should do one thing and do it well
- Programs should work together
- Output should always be in text format

<!-- Explain how CURL's text output can be consumed by another program. The URL is passed as a "parameter" to the program CURL and it makes a web request to that URL. -->

---

# How to Understand Commands?

`curl` is a short, pronounceable name that doesn't explain exactly what the command does.

<!-- You'll find that this is the case for a lot of the programs I'll be showing off today. The name might not explain right away what that command does. This is kind of a general naming convention for these command line programs. -->

. . .

How do you understand what a command does?

. . .

Read the manual!

```sh
man curl
```

<!-- Man is just another program that comes standard with most Unix distributions. It contains manual pages that explain what all of the commands do. New programs that you install to use for scripting will usually come with their own man pages. -->

---

# Managing Projects in the Terminal

Git, the popular source control tool, was designed for terminal use.

<!-- Git has taken over the world of source control, and I'm sure you've used it yourself. You may use GUI git clients, like GitKraken or GitHub desktop. However, I've never found one that has the same flexibility as the terminal Git client. -->

. . .

Avoid repeating yourself with aliases.

```sh
alias gphm="git push heroku master"
```

<!-- Aliases are a feature of the shell that works anywhere. If you find yourself repeating the same command over and over again, you can make an alias of it to make it much faster to type. For instance, when deploying to Heroku I found myself typing "git push heroku master" over and over again. I was able to alias it to create my own command to push to heroku that's only four characters long. -->

. . .

If you want to follow along...

```sh
git clone "https://github.com/drewhodson/mpamf"
```

<!-- This repository contains all of the examples I'm discussing, plus some additional extra things that might help you learn more about shell scripting. Additionally, it contains the full text of this presentation so you don't have to take notes. -->

---

# Web Browsing in the Terminal

You can use the terminal browser `w3m` to browse the internet in your terminal window.

<!-- So, we've already shown off the program CURL and how it can dump the text content of a webpage to your terminal. What if you want to view a webpage directly in the terminal? -->

```sh
w3m google.com
```

. . .

How do we get the program `w3m`?

<!-- We could open our web browser, go to a search engine, type in the name of the program, find the homepage, find the download link, click on it, wait for it to download, run the installer... But there's a much easier way. -->

. . .

To install `w3m` with homebrew:

```sh
brew install w3m
```

<!-- Now, your package manager is going to change depending on your platform. Homebrew is the mac package manager, but on a linux system you might use apt or pacman. The same is true for a Windows machine running the windows subsystem for linux. -->

---

# Ease of Install: Setup Scripts

You can string together commands and place them in a script.

<!-- Everything we've seen so far is just a single command. The power of shell scripting comes from the ability to string these together in a file and run them in sequence at any time. -->

. . .

If you wanted to automate the installation of your favorite packages:

```sh
#!/bin/sh
brew install w3m
brew install fzf
brew install moreutils
brew install git-extras
```

<!-- You can create a file that contains all of the install commands for programs you like to have on hand, and automate the install process for all your machines. You can then add that file to a git repository and you'd be able to get it from anywhere and run all your install commands on any computer. You could go even further by setting up your environment, and configuring all of your settings and customizing things how you like them. -->

. . .

There is an install script in this presentation's repo that will install all the utilities I mentioned in the talk.

<!-- For anyone who missed the repo link that would be interested in getting the script, I'll share the name of this repo again at the end of the talk. -->

---

# Ease of Install: Setup Scripts

Say you have a Node project you want to set up the environment for.

```sh
#!/bin/sh
type nvm > /dev/null
if [ $? -ne 0 ] ; then
  echo "Please install NVM"
  open "https://github.com/nvm-sh/nvm"
  exit
fi
nvm install 10
npm install
```

<!-- Go through this script in detail. "$?" means "the result of the last command" and if it is anything but zero that means there was an error. You could go much further than this, if you are using a Postgres database as a backend you could go through the install of Postgres, set the appropriate configuration variables, and start the server. You could commit this file with the repository and anyone working on developing this project will be able to get set up on their local machine with little effort. -->

---

# Creating Your Own Custom Commands

You can create your own utilities and put them in your `$PATH` to make them available from anywhere.

<!-- This is a variable in your shell that contains the directories to search when attempting to run a command. You can write your own custom scripts and instead of having to run them from the directory where they currently are sitting, you can run those commands from any directory on your machine. -->

. . .

Example: repository search.

<!-- Talk about the process of opening GitHub and searching across the organization, show it off if able. Then launch scripts/open_repo.sh -->

. . .

Only ~45 characters of code.

<!-- Show the code and explain how the flow goes from one program to another, and talk about how pipes work. Talk about the program fzf. -->

. . .

Now you can name this command something like "repo" and use it anytime.

---

# Motivating Example: Mass File Operations

Say we want to perform some operations on a group of files.

<!-- We need some files to operate on. At this point, run scripts/fetch_photos.sh and explain how it works. Explain the parameter passing. Highlight how in the GUI you'd just be refreshing the page and downloading an image over and over. In a programming language, you'd have to import libraries and so on. In shell, you're composing programs. -->

. . .

The wildcard character, "\*", allows you to select a group of files to perform operations on.

<!-- Show how you can open all of the files at the same time. Show how you can then move them to a different directory. Then show how you can remove all of them. -->

---

# Motivating Example: Search in all Files

What if you wanted to find a certain string across all files in a subdirectory?

```sh
search () {
  grep -rn \
    --exclude-dir=node_modules \
    --exclude-dir=.git \
    "$1" .
}
```

<!-- Demo this function, then talk about how you can add this to your profile file. -->

---

# Example: Working With Heroku

Getting the Heroku CLI program is simple:

```sh
brew tap heroku/brew && brew install heroku
```

. . .

The Heroku CLI program has a command that returns an application's configuration:

<!-- Show what it takes in order to fetch the configuration from the Heroku application, go to the website and show the process you must go through to see the configuration. -->

```sh
heroku config -a drew-hodson-test-1 -s
```

. . .

If we just want the email-related configuration variables, we can find the ones that match with `grep`:

```sh
heroku config -a drew-hodson-test-1 -s \
  | grep 'EMAIL'
```

---

# Example: Working With Heroku

What if we need to copy a Heroku configuration to our local machine?

```sh
heroku config -a drew-hodson-test-1 -s > .env
```

<!-- Say you want to be able to run the application on your local machine for testing. The .env file format can be used to set the environment variables inside the application. The greater than symbol here is used for redirecting output of a command to a file, like piping but with the destination going to a file location. You can use two greater than symbols to append to that file. -->

. . .

There is an easy way to copy configurations between apps, too:

```sh
heroku config -a drew-hodson-test-1 -s \
  xargs heroku config:set -a \
  drew-hodson-test-2
```

---

# Example: Testing APIs

You can test API endpoints using a program like Postman.

. . .

You can also do it in Shell.

<!-- Show your example API testing program. Talk about how you can customize this program to work however you like, and pass the output of the program to a different program, something Postman can't do. It's easy to save the output to a file, and there are utilities to process JSON data within the shell. -->

---

# Integration With Any Programming Language

One of the best things about Shell is its ability to interact with just about any programming language.

. . .

You can run a script in any language by changing the "Hash-bang" at the beginning of a script.

You could write a utility in python that shuffles lines of input and run it as part of any other script:

```python
#!/usr/bin/env python
import random
import sys

lines = [l.rstrip() for l in sys.stdin]
random.shuffle(lines)

print "\n".join(lines)
```

---

# Integration With Any Programming Language

...or, write it in Ruby

```ruby
#!/usr/bin/env ruby
STDIN.read.split("\n").shuffle.each do |a|
  puts a
end
```

---

# Integration With Any Programming Language

...or in JavaScript

```javascript
#!/usr/bin/env node
const fs = require('fs');

const shuffle = (a) => {
    for (let i=a.length-1; i>0; i--) {
        const j = ~~(Math.random()*(i+1));
        [a[i], a[j]] = [a[j], a[i]];
    }
    return a;
}

const l = fs.readFileSync('/dev/stdin')
  .toString();

console.log(
  shuffle(l.split('\n')).join('\n')
);
```

---

# Integration With Any Programming Language

...or in Haskell

```haskell
#!/usr/bin/env runhaskell
import System.Random

insert z x n = take n z ++ [x] ++ drop n z

shuffle = foldr (\x ->
  (>>= (\z ->
    insert z x <$> randomRIO (0, length z))))
  (pure [])

main = getContents >>= shuffle . lines
  >>= putStr . unlines
```

---

# Helpful Tips For Working in the Shell

You can use `!!` to reference the previous command.
<!-- This is great if you forget to use super-user permissions for your previous command. -->

. . .

You can use `!$` to reference the last parameter of the last command.

. . .

You can press Ctrl+R to search backwards in your input history.

---

# How to get Started

How can you get started writing your own Shell scripts? I recommend the following resources:

* The program `shellcheck`
* The website *explainshell.com*
* `curl cht.sh`

<!-- Show how to use the site cht.sh -->

---

# Summary

What's the take away from all this?

<!-- I wanted to show some of what's possible using the terminal vs. working in the GUI. And while it would be quite difficult to replace everything that you do daily working only in the terminal, there's a lot of possibility for increased productivity working this way. I handle source control in my terminal, I edit files in my terminal, I test APIs in my terminal, I configure heroku applications in the terminal. There are even things that I do that would be impossible to replicate using GUIs alone. The cherry on top is that I'm doing all of these things without switching programs. Everything that I'm doing is just a few keystrokes away. So much of your attention gets lost when you switch windows and your brain tries to switch contexts. I can do all of these things in the same window and combine their effects together. I don't expect everyone to leave here and immediately start doing everything with shell scripts, but I hope that everyone learned something new and is able to use that to their advantage in their daily life. -->

---

# Thank you!

Thank you for attending my talk.

. . .

You can get the code, all the scripts and examples, from this repo:

```sh
git clone "https://github.com/drewhodson/mpamf"
```

<!-- The full text of the presentation is also in the repo, as well as some other fun things I didn't go over in the presentation. Hopefully if you're interested in learning more, you can dig into the examples and tweak them and learn from them. -->

. . .

Any questions?
