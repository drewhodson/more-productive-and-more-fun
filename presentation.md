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

To change between directories, you can type `cd ${directory}` to change to that directory:

```sh
bash-5.0$ cd Documents
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
/usr/you/Documents
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
Apples
Bananas
Carrots
Dynamite
```

---

# Basics: Working With Files

Now we have a grocery list sitting in our _Documents_ folder. However, what if we want to organize our files better?

. . .

We can create a new directory with the command `mkdir`: *m*a*k*e *dir*ectory.

```sh
bash-5.0$ mkdir notes
```
