---
layout: post
title: "emacs-setup"
date: 2013-09-04 17:18
categories: core-tools emacs
---

# Overview

I am happy to have finished
[the first draft][jedcn-emacs-setup-first-draft] of my emacs
configuration! It is rudimentary, but I am proud of it all the
same. The configuration, and a written description of what is included
are available in [PDF][emacs-setup-pdf] and [HTML][emacs-setup-html]
and [elisp][emacs-setup-el].

# Background

I had been looking for an excuse to wander around emacs, and the
opportunity arose recently as part of moving my config to a new
laptop. Rather than wholesale copy my old config, I was inspired to
create a new one by this advice:

>  As an Emacs user, you're going to have to get comfortable seeking
>  out new pieces of elisp, bringing them in, configuring them, and
>  eventually writing your own. The Starter Kit can help this process
>  by giving hints as to where to start and what to look for, but
>  constructing a solid configuration is ultimately a personal journey
>  for which you must take the first steps.

[- technomancy, Emacs Starter Kit, v3][github-technomancy-esk]

Looking to take my "first steps," and with my interest sparked in
Knuth's [Literate Programming][wikipedia-lp] by
[Sacha Chua][sacha-chua-emacs-config], I set off to write a coherent
prose description of my elisp config. The end result is my
[emacs-setup][github-jedcn-es], and the ability to generate
[a description of my config][emacs-setup-pdf] as well as
[just the pure elisp][emacs-setup-el].

# Goals

I set out to make a configuration that was:

* __Beautiful__: The literate programming facilities in emacs allowed
  me to rely on the LaTeX typesetting system and this meant the end
  goal could be [a nice looking PDF][emacs-setup-pdf].
* __Well Documented__: I am not comfortable with elisp, and I don't
  spend that much time hacking on my config. Thorough documentation
  enables me to more quickly get back into context when I return in
  the future.

Combining these two, my emphasis was on strong documentation and
beautiful typesetting __from the start__ and as a __top priority__. I
suspect _Beautiful_ and _Well Documented_ would be the natural result
of most Literate Programming attempts. However, additional goals were
to make the configuration:

* __Organized__: The system I am using allows my configuration to be
  broken down into discrete files. Each file has a distinct purpose.
  This is similar to the themes that Zach Holman espouses with
  [his dotfiles][zachholman-dot-files].
* __Reproducible__: I wanted a system where I could run an `rm -rf
  ~/.emacs.d` without flinching and reliably be back to where I was
  before the `rm` just a few moments later. This is inspired by
  [working with vagrant][vagrant-rebuild] and every-so-often testing
  your configuration management setup by doing a `vagrant destroy;
  vagrant up`.
* __Easily Tested__: I wanted to work with a system that allowed me to
  have distinct installations living on the same machine. This is
  closely related to reproducibility: if I can easily work with a new
  version of my configuration at `/tmp/emacs-test`, then I can be
  confident in deleting `~/.emacs.d`.

_Reproducible_ and _Easily Tested_ are not difficult to achieve with
emacs. The hardest part was having the discipline, from an early
stage, to actively delete my `~/.emacs.d` several times a day. I
admit, the first time I just did a `mv ~/.emacs.d
~/.emacs.d-please-work`, but it was pleasant to get to a point where I
could delete and re-create with ease.

# In Closing

This was the first literate program that I wrote, and I enjoyed doing
it. I think I have a system that I understand, that I can maintain,
and that I can extend. Having written this up, I'm off to go watch
some [emacsrocks.com][emacs-rocks-com] or read up on some
[emacsredux.com][emacs-redux-com] or learn more about elisp via
[emacsbites.com][emacs-bites-com].

Before I close the chapter on this post, I would be remiss if I didn't
at least point out that [Babel][babel] and [Org-mode][org-mode], the
parts of emacs that enable literate programming, are a real delight to
work with! If you are thinking of treading this path, be sure to check
out Schulte's
[A Multi-Language Computing Environment for Literate Programming and Reproducible Research][jstatsoft-lp-and-rr].

## Resources

* A PDF document describing my emacs-setup:
  [emacs-setup.pdf][emacs-setup-pdf].
* An HTML document describing my emacs-setup:
  [emacs-setup.html][emacs-setup-html].
* The elisp that is my emacs-setup: [emacs-setup.el][emacs-setup-el].
* [The code from emacs-setup][jedcn-emacs-setup-first-draft] (v0.0.1).
* [Sacha Chua's Literate Emacs Config][sacha-chua-emacs-config]
* [Emacs Starter Kit][github-technomancy-esk].
* A good place to get excited about emacs:
  [emacsrocks.com][emacs-rocks-com].
* A good place to get excited about elisp:
  [emacsbites.com][emacs-bites-com].
* A neat site with emacs goodness: [emacsredux.com][emacs-redux-com].
* Eric Shulte's [paper][jstatsoft-lp-and-rr] on doing Literate
  Programming in Emacs.
* [Org-mode][org-mode]
* [Babel][babel]: active code in Org-mode

[babel]: http://orgmode.org/worg/org-contrib/babel/
[emacs-bites-com]: http://www.emacsbites.com/
[emacs-redux-com]: http://emacsredux.com/
[emacs-rocks-com]: http://emacsrocks.com/
[emacs-setup-el]: https://github.com/jedcn/emacs-setup/blob/v0.0.1/emacs-setup.el
[emacs-setup-html]: /files/posts/emacs-setup/emacs-setup.html
[emacs-setup-pdf]: /files/posts/emacs-setup/emacs-setup.pdf
[github-jedcn-es]: https://github.com/jedcn/emacs-setup
[github-technomancy-esk]: https://github.com/technomancy/emacs-starter-kit
[jedcn-emacs-setup-first-draft]: https://github.com/jedcn/emacs-setup/tree/v0.0.1
[jstatsoft-lp-and-rr]: http://www.jstatsoft.org/v46/i03
[org-mode]: http://orgmode.org/
[sacha-chua-emacs-config]: http://sachachua.com/blog/2012/06/literate-programming-emacs-configuration-file/
[vagrant-rebuild]: http://docs.vagrantup.com/v2/getting-started/rebuild.html
[wikipedia-lp]: http://en.wikipedia.org/wiki/Literate_programming
[zachholman-dot-files]: http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/
