---
layout: post
title: "Mac Install"
date: 2013-06-25 15:55
categories: core-tools
---

# Overview

These notes describe how I setup a Mac.

For now, they take the form of individual commands that I run and
software that I install.

Hopefully, someday, they'll be automated ala [Boxen][boxen].

# Background

I am fortunate to find myself working at a company that provides me
with a nice computer setup.

As of May 2013, this means I'm on MacOS, and I recently went through a
re-install. As I was doing this, I was hoping to take a closer look at
[Github's Boxen][boxen], but time was short and I missed out.

Instead of looking further into Boxen, I took notes as I got up and
running, and these are those notes.

# Installation Notes

At a high level, here's what I do:

# Step 1: xCode

This is accomplished via the AppStore. I log in with my personal id,
and at the time of my most recent install the latest version of xcode
was 4.6.2.

# Step 2: Brew

Next up is [Homebrew][brew].

I follow the instructions in the link above, which indicate that I
should do this:

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

## Step 2.1: brew + git

    brew install git

Brew puts `git` into `/usr/local/bin`, which, for now, contains stuff
that I prefer over `/usr/bin` (ie: brew git vs. apple git), so I
modified my PATH appropriately:

    #
    # I added this to my .bash_profile
    PATH=/usr/local/bin:$PATH

Once you've got `git`:

    git config --global user.name "your name"
    git config --global user.email "your@email.com"

While browsing through Github's
[help on setting up git][github-setup-git] I became aware of this
configuration possibility:

    git config --global credential.helper osxkeychain

I set this up for short-term convenience, but I also generate a
keypair and register the public key with github as well.

I make sure to setup colors:

    git config --global color.ui true

And finally, I make it so that when I commit from the command line
(this happens rarely because I'm normally using [magit]), I can supply
the message via emacs:

    git config --global core.editor /usr/local/bin/emacsclient

I get emacs from brew (described below, and so I get `emacsclient`
from `/usr/local/bin`).

### Global Git Config vs. Local Git Config

As a side note, I find myself in a situation where I usually want 90%
of my projects on my machine to use my main git config, but for the
remaining 10% I'd like to use a different email address. I achieve
that through mixing global and local config options, which work (as I
understand) as follows:

If you'd like to have configuration options specified on a
project-by-project basis, you can setup configuration local to a
project by cd'ing into that project and running something like:

    git config --local key value

For example, to change your `user.email` on a specific project, cd
into that project and run:

     git config --local user.email "northridge@gmail.com"

## Step 2.2: brew + ack/ag

These are a must for searching through code bases. I lean toward `ack`
right now, but I've been keeping an eye on `ag`.

    brew install ack
    brew install ag

## Step 2.3: brew + tree

    brew install tree

## Step 2.4: brew + markdown

My interest in a command line markdown is fueled by my editor. It
provides preview capabilities that rely on a command line markdown
processor.

    brew install markdown

## Step 2.5: brew + node

    brew install node

## Step 2.6: brew + mysql

    brew install mysql

## Step 2.6: brew + wget

    brew install wget

## Step 2.6: brew + emacs

    brew install emacs --cocoa
    ln -s /usr/local/Cellar/emacs/24.3/Emacs.app /Applications

# Screen Zoom

I really, really enjoy holding down `control` and zooming in or out
with my trackpad. This was made harder to enable with Mountain Lion,
but it's handily setup in just a moment following
[these instructions from bkbeachlabs.com here][bkbeachlabs-screen-zoom]

# Remap CAPS LOCK

To avoid the dreaded [Emacs Pinky][wikipedia-emacs-pinky] I re-map
`CAPSLOCK` to `CONTROL` each time I land on a new computer.

I've followed different instructions in the past, but here are the
ones that pointed me in the right direction:
[random question/answer on stackoverflow.com][stackoverflow-emacs-macos-keybindings].

Remember to do both your computer and your bluetooth keyboard. Look
for the "Select Keyboard" combo box on the "Modifier Keys.." dialog.

# Install Slate

Here's how I get slate itself:

    cd /Applications && curl http://www.ninjamonkeysoftware.com/slate/versions/slate-latest.tar.gz | tar -xz

And then how I setup the configuration:

    mkdir -p ~/c/personal
    cd ~/c/personal
    git clone https://github.com/jedcn/getting-started-with-slate.git
    cd ~
    ln -s c/personal/getting-started-with-slate/.slate .slate

Then I started up Slate.

For additional notes about Slate, [check out this post][jedcn-slate].

# iTerm2

I've been sticking with the default Terminal recently, but I usually
grab iTerm2 before too long. This time around I got it from here:
[iterm2 downloads list](https://code.google.com/p/iterm2/downloads/list)

And then, if I unzipped it and saw Downloads/iTerm.app I ran:

    mv ~/Downloads/iTerm.app /Applications

# Pandoc

I installed Pandoc for the first time recently, and it was.. exciting.

I pursued Pandoc (and BasicTeX) for the sole purpose of, within emacs,
being able to generate pdf documents ala `org-export-as-pdf`.

I'm not sure this is worth the effort (particularly the BasicTeX
part), but, anyway..

I started here:
[pandoc install instructions][pandoc-install-instructions].

Which directed me to this page for pandoc itself where I grabbed the
.dmg: [pandoc downloads list][pandoc-downloads].

## Pandoc: BasicTeX

Here is where I found BasicTeX:
[the packages section][tug-mactex-basictex], as recommended by the
Pandoc install pages.

Things got complicated, quickly, with BasicTeX.

They tell you to read through the installation instructions in this
[document][basictex-install-notes], and I found them worthwhile.

Here's what I did:

Download the package for BasicTeX. There's an installer. After you run
there's a directory that's been created at
`/usr/local/textlive/2013basic`

If you cd into it, and then run `sudo ./install-tl`, you'll be
presented with a text based wizard. I ran the following cryptic
commands:

    s, then a, then r
    o, then r, then r
    d, then 7, then ~/Library/texmf

Then I pressed `i` to run the installation. Whew. Time to figure out
boxen, because I'm not sure I'll be able to get there again.

There's more tweaking to Emacs to make it aware of where to find
`pdflatex`, but that's for another time.

At any rate, I then ran the following commands to install various
LaTeX styles:

```
sudo tlmgr install wrapfig
sudo tlmgr install soul
sudo tlmgr install marvosym
sudo tlmgr install wasysym
```

# Conclusion

It's not pretty, but it's a start. Hopefully I'll move on to
automating this soon.

# Resources

* [Github's Boxen][boxen]
* [Homebrew][brew]
* [Github's Help on Git Setup][github-setup-git]
* [Magit][magit]
* [Instructions for Screen Zoom][bkbeachlabs-screen-zoom]
* [Wikipedia's Entry for Emacs Pinky][wikipedia-emacs-pinky]
* [Stackoverflow Entry for Emacs Keybindings on Macos][stackoverflow-emacs-macos-keybindings]
* [jedcn's Slate Entry][jedcn-slate]
* [Pandoc Install Instructions][pandoc-install-instructions]
* [Pandoc Downloads][pandoc-downloads]
* [MacTeX BasicTeX][tug-mactex-basictex]
* [BasicTeX Install Notes][basictex-install-notes]

[boxen]: http://boxen.github.com/
[brew]: http://mxcl.github.io/homebrew/
[github-setup-git]: https://help.github.com/articles/set-up-git
[magit]: http://www.emacswiki.org/emacs/Magit
[bkbeachlabs-screen-zoom]: http://bkbeachlabs.com/blog/screen-zoom-in-os-x-mountain-lion/
[wikipedia-emacs-pinky]: https://en.wikipedia.org/wiki/Emacs#Emacs_pinky
[stackoverflow-emacs-macos-keybindings]: http://stackoverflow.com/questions/162896/emacs-on-mac-os-x-leopard-key-bindings
[jedcn-slate]: http://jedcn.com/posts/slate/
[pandoc-install-instructions]: http://johnmacfarlane.net/pandoc/installing.html
[pandoc-downloads]: https://code.google.com/p/pandoc/downloads/list
[tug-mactex-basictex]: http://www.tug.org/mactex/morepackages.html
[basictex-install-notes]: http://pages.uoregon.edu/koch/BasicTeX.pdf
