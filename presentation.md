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

I've been working at DMI for nearly a year, currently on the Cirrus team at Eli Lilly.

. . .

# What Do I Like?

I'm a big fan of programming in general. My current interests are Haskell, NodeJS, and Shell.

---

# Motivation

I've always been a big fan of automating tasks. I believe that there's a perfect sweet spot between lazy and motivated that makes one a programmer.

. . .

If you're lazy like me, you want to do something once and never again.

. . .

It's like applying the D.R.Y. (Don't Repeat Yourself) principle to everything in life!

. . .

Shell scripting feels like this huge revelation to me. Such powerful tools, already installed on your machine, that can save all kinds of time on your daily tasks.

---

# Introduction to Shell Scripting

I'm going to start from nothing at all and work my way up from there.

. . .

If you have a Mac or Linux machine, or a Windows machine with the Windows Subsystem for Linux installed, open a terminal if you'd like to follow along.

. . .

While the Windows terminal with Powershell is certainly capable of the things I'm going to show, all of my examples are going to be targeting the `bash` shell.

---

# What am I Looking At?

If you have a `bash` window open, you may see something like this:

```
bash-5.0$ 
```

. . .

This is called the prompt, where we'll enter all of the commands outlined moving forward.

---

# Basics: Navigating Folders

In your terminal, type `ls` to list the items in the home directory:


```sh
bash-5.0$ ls
Applications Desktop Documents
Downloads Library Mail Movies
Music Pictures Public
```

---

# Basics: Navigating Folders

We want to create a folder to store the files for this presentation in.

We can create a new directory with the command `mkdir`: *m*a*k*e *dir*ectory.

```sh
bash-5.0$ mkdir presentation
```
---

# Basics: Navigating Folders

To change between directories, you can type `cd ${directory}` to change to that directory.

We can change to the directory we just made with `cd presentation`.

```sh
bash-5.0$ cd presentation
bash-5.0$ ls
index.js node_modules patat.hs
presentation.md
```

. . .

To find out which directory you're in, type `pwd` which stands for 

- *P*Current
- *W*orking
- *D*irectory

```sh
bash-5.0$ pwd
/usr/you/presentation
```

---

# Basics: Working With Files

How can we create a file to operate on?

. . .

There are several text editors that are terminal-based. I use _Vim_, but _Nano_ is pretty easy to pick up. _Emacs_ is another notable terminal editor.

. . .


Open a new file in _Nano_ by typing `nano ${filename}`.

```sh
bash-5.0$ nano grocery_list.txt
```

This will open the file `grocery_list.txt` in the _Nano_ editor.

---

# Basics: Working With Files

Now that we've created our grocery list, how can we read it?

. . .

One way is to con*cat*enate the file to the screen, with `cat`.

```sh
bash-5.0$ cat grocery_list.txt
Corn
Squash
Beets
Dynamite
```

---

# Basics: Working With Files

Now we have a grocery list sitting in our _presentation_ folder. However, what if we want to organize our files better?

. . .

We can create a subfolder with the `mkdir` command again, and *m*o*v*e the grocery list to that folder with the `mv` command.

```sh
bash-5.0$ mkdir lists
bash-5.0$ mv grocery_list.txt lists
bash-5.0$ ls lists
grocery_list.txt
```

---

# Basics: Working With Files

What if you prefer that your grocery list is in alphabetical order? The `sort` command will, as it sounds, sort your file alphabetically.

```sh
bash-5.0$ sort lists/grocery_list.txt
Beets
Corn
Dynamite
Squash
```

. . .

If you notice, your original list will remain unsorted.

This is by design. It allows you to do more things with a sorted file than just to save it.

---

# Redirection and Pipes

Say you want to save that sorted list. You'll want to redirect the output of `sort` to a new file.

```sh
bash-5.0$ cd lists
bash-5.0$ sort grocery_list.txt > sorted.txt
bash-5.0$ cat sorted.txt
Beets
Corn
Dynamite
Squash
```

---

# Redirection and Pipes

You can redirect the output of a command into another command.

This is the way shell commands compose.

Say you want to con*cat*enate a file to the screen, *sort* that output, then *n*umber the *l*ines (`nl`).

```sh
bash-5.0$ cat grocery_list.txt | sort | nl
     1  Beets
     2  Corn
     3  Dynamite
     4  Squash
```

---

# Redirection and Pipes

You can think of these pipes, represented by the pipe character `|` to be like real world pipes. Instead of water, they carry text.

. . .

Text flows from command to command and is modified by each in turn.

```
a pipe:       |       |              
              |  cat  |              
              |       |              
              |   |   |              
              |   V   |              
              |       |              
              |  sed  |              
              |       |              
              |   |   |              
              |   V   |              
              |       |              
              |  awk  |              
              |       |              
```

---

# Text Searching and Manipulation

You can search for text in a given file using the `grep` command, which stands for global regular expression parse.

```sh
bash-5.0$ grep "S" grocery_list.txt
Squash
```

. . .

`grep` is case-sensitive by default. The `-i` flag makes it case insensitive.

```sh
bash-5.0$ grep -i "S" grocery_list.txt
Squash
Beets
```

---

# Text Searching and Manipulation

You can use the `tr` command to *tr*anslate characters, replacing one with another.

```sh
bash-5.0$ tr 't' 'r' < grocery_list.txt
Corn
Squash
Beers
Dynamire
```

. . .

Another way you could use `tr` is to translate uppercase characters into lowercase ones.

```sh
bash-5.0$ tr '[:upper:]' '[:lower:]' \
  < grocery_list.txt
corn
squash
beets
dynamite
```

---

# Text Searching and Manipulation

A more powerful solution for replacing text is the `sed` command: *s*tream *ed*itor. It edits the stream of text that flows through a pipe using regular expressions.

The following expression adds "Canned" to the front of every grocery item.

```sh
bash-5.0$ sed 's/^/Canned /' grocery_list.txt
Canned Corn
Canned Squash
Canned Beets
Canned Dynamite
```

---

# So, How is this Useful?

So why am I showing you all these little programs that deal with streams of text?

. . .

They serve as building blocks for automating your other tasks.

. . .

I like to think of Shell as the language with the best standard library and package system.

Just learning some simple tools will build a foundation that can make things so much easier.

---

# Getting This Repository

If at this point you're still following along, clone the repo that contains this presentation for more sample data to use.

```sh
bash-5.0$ git clone \
"https://github.com/drewhodson/mpamf"
bash-5.0$ cd mpamf
```

---

# Example: Working With Heroku

On my current engagement, I'm working a lot with Heroku applications and configuring them can be a chore.

Working through the web interface, finding how two Heroku configurations differ is like playing eye spy.

. . .

Trying to copy a configuration from one application to another is painstaking.

. . .

Even merely viewing an application's configuration can take forever to load.

. . .

Is there a better way?

---

# Example: Working With Heroku

The Heroku CLI program has a command that returns an application's configuration:

```sh
bash-5.0$ heroku config -a {app} -s
DEBUG_LOGGING=false
EMAIL_ADDRESS=test@test.com
EMAIL_PASSWORD=p4ssw0rd
```

. . .

If we just want the email-related configuration variables, we can find the ones that match with `grep`:

```sh
bash$ heroku config -a {app} -s | grep 'EMAIL'
EMAIL_ADDRESS=test@test.com
EMAIL_PASSWORD=p4ssw0rd
```

---

# Example: Working With Heroku

Say we need to run an application on our local machine instead of running on Heroku. We can copy the remote configuration to a .env file on our machine to read from.

```sh
bash$ heroku config -a {app} -s > .env
```

. . .

There is an easy way to copy configurations between apps, too:

```sh
bash$ heroku config -a {app} -s |     \
      xargs heroku config:set -a {app2}
```

---

# Example: Working With Many Projects

On my assignment, there are a lot of GitHub repos together in the same organization. It can become a headache trying to quickly jump between all of them.

If you can obtain a list of all the GitHub repo URLs in an organization (likely, using the GitHub API) writing a script that allows you to search them and jump to the one you want is easy:

```sh
#!/bin/sh
cat example/repos.txt | fzf | xargs open
```

---

# Integration With Any Programming Language

One of the best things about Shell is its ability to interact with just about any programming language.

. . .

Write a NodeJS script that interacts with the GitHub API to auto-generate a list of your organization's repos, then use the fuzzy find script from earlier to search all repos from the command line.

---

# Miscellaneous Utilities

To get a quick glance at the current month, use the `cal` command:

```sh
bash-5.0$ cal
    August 2019       
Su Mo Tu We Th Fr Sa  
             1  2  3  
 4  5  6  7  8  9 10  
11 12 13 14 15 16 17  
18 19 20 21 22 23 24  
25 26 27 28 29 30 31  
```

---

# Miscellaneous Utilities

To look at the weather for today, the following site exists:

```sh
bash-5.0$ curl wttr.in
```

. . .

For a "cheat sheet" in the terminal, the site *cht.sh* exists:

```sh
bash-5.0$ curl cht.sh
```

---

# How to get Started

How can you get started writing your own shell scripts? I recommend the following resources:

* The program `shellcheck`
* The website *explainshell.com*
* Simply searching "how do I do X in shell?"
