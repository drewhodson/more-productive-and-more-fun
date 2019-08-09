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

You can replace text in a file with the `sed` command: *s*tream *ed*itor. It edits the stream of text that flows through a pipe.

```sh
bash-5.0$ sed 's/t/r/' grocery_list.txt
Corn
Squash
Beers
Dynamire
```
