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

<!-- I find that during these talks, a lot of the time it's hard to remember what you learned when you leave. I want to show you some cool things that you can do and hopefully pique your interest in using the terminal, and show that it isn't just for people who want to look like hackers. -->

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

The previous example, `curl wttr.in` uses a program called `curl`.

Basically all it does is make web requests.

<!-- Show some other uses of curl, like curl on http://www.google.com. Explain what curl is and does. -->

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

<!-- You'll find that this is the case for a lot of the programs I'll be showing off today. The name might not explain right away what that command does. -->

. . .

How do you understand what a command does?

. . .

Read the manual!

```sh
man curl
```

<!-- Man is just another program that comes standard with most Unix distributions. It contains manual pages that explain what all of the commands do. New programs that you install to use for scripting will usually come with their own man pages. -->

---

# Web Browsing in the Terminal

You can use the terminal browser `w3m` to browse the internet in your terminal window.

<!-- So, we've already shown off the program CURL and how it can dump the text content of a webpage to your terminal. What if you want to view a webpage directly in the terminal? -->

```sh
w3m google.com
```

---

# Managing Projects in the Terminal

Git, the popular source control tool, was designed for terminal use.

<!-- Talk about how no GUI Git client manages to be as full-featured as Git itself is. -->

. . .

If you want to follow along...

```sh
git clone "https://github.com/drewhodson/mpamf"
cd mpamf
```

---

# Ease of Install: Package Managers

Installing programs in the terminal is extremely easy.

<!-- Talk about how involved it is to go out, google the name of a program, click on the installer, install the program vs package manager. -->

. . .

To install `w3m` with homebrew:

```sh
brew install w3m
```

---

# Ease of Install: Setup Scripts

You can string together commands and place them in a script.

<!-- Everything we've seen so far is just a single command. You can string these together in a file and run them in sequence any time. -->

. . .

Say you want to keep a list of your favorite programs on hand so your next computer is ready to go:

```sh
#!/bin/sh
brew install w3m
brew install fzf
brew install moreutils
brew install git-extras
```

<!-- Talk about how stringing together commands and saving them in a file can really help you automate menial tasks. -->

. . .

There is an install script in this presentation's repo that will install all the utilities I mentioned in the talk.

<!-- I'll share the link again at the end for anyone who missed it that is interested. -->

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
nvm use 10
npm install
```

<!-- Go through this script in detail. -->

---

# Creating Your Own Custom Commands

You can create your own custom commands and invoke them with a single keyword.

. . .

Motivating example: repo search.

<!-- Talk about the grueling process of opening GitHub and searching across the organization, show it off if able. Then launch scripts/open_repo.sh -->

. . .

Only ~45 characters of code.

. . .

Now you can name this command something like "repo" and use it anywhere.

---

# Motivating Example: Mass File Operations

Say we want to perform some operations on a group of files.

<!-- Say, we need some files to operate on. At this point, run scripts/fetch_photos.sh and explain how it works. Explain the parameter passing. Highlight how in the GUI you'd just be refreshing the page and downloading an image over and over. In a programming language, you'd have to import libraries and so on. In shell, you're composing programs. -->

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

Say we need to run an application on our local machine instead of running on Heroku. We can copy the remote configuration to a .env file on our machine to read from.

```sh
heroku config -a drew-hodson-test-1 -s > .env
```

. . .

There is an easy way to copy configurations between apps, too:

```sh
heroku config -a drew-hodson-test-1 -s \
  xargs heroku config:set -a \
  drew-hodson-test-2
```

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

# How to get Started

How can you get started writing your own Shell scripts? I recommend the following resources:

* The program `shellcheck`
* The website *explainshell.com*
* `curl cht.sh`

<!-- Show how to use the site cht.sh -->

---

# Thank you!

Thank you for attending my talk.

. . .

Any questions?

. . .

You can get the code, all the scripts and examples, from this repo:

```sh
git clone "https://github.com/drewhodson/mpamf"
```
