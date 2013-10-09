---
layout: post
title: Nearly Free Jekyll
categories: jekyll
---

# Overview

How to get a [Jekyll][jekyll] generated site up on
[Nearly Free Speech][nearlyfree] with minimal hassle.

## Update

This site used to be created with Jekyll, and I wrote this to remind
myself of what it took to "bootstrap" the site. That said, I've since
switched to Octopress. I still generate locally, and I still rsync
stuff up.

# Background

[Nearly Free Speech][nearlyfree] is a popular hosting provider that's
good at hosting static content. It isn't too expensive and gives you
the ability to publish (or un-publish) whatever you want.

[Jekyll][jekyll] is a static site generator.

There are many strategies for publishing a site that you've built with
Jekyll.

Which strategy you pick will depend on your publishing platform /
hosting provider.

However, if you're using Nearly Free Speech, my suggestion is that you
use straight-up **rsync**.

In particular, avoid the lure of using things like a [git][git]
post-receive or post-update hook. If you've already got a local setup
running the way you like with Jekyll *and* you don't explicitly
control the server-side environment that you're publishing into, then
it is:

* less overall work,
* less error-prone, and
* easier to troubleshoot

a process where you upload your generated site.

# Suggested Workflow

* Generate your site locally, and
* Preview it locally, and
* Once you're happy with what you've got, use the unix utility rsync
  to update NFSN's ```/home/public``` with your local ```_site```

# Getting Started

## Assumptions

Before you begin, you should create a site with [jekyll][jekyll] and
then start tracking it in [git][git].

You should be able to preview this site by running ```jekyll
--server``` and be ready to make this site available on the web.

You should have signed up with Nearly Free Speech so that you've got
an account and ssh access to a box.

## RSync

If you run ```jekyll --no-auto``` it'll regenerate a fresh version of
your site in the ```_site``` directory.

Once you've got everything you want in ```_site``` you can rsync it
up to Nearly Free Speech.

Putting the two commands together:

{% highlight console %}
$ jekyll --no-auto
$ rsync -crz --delete _site/ <NFSN_LOGIN>@ssh.phx.nearlyfreespeech.net:/home/public
{% endhighlight %}

If you put this into a Rakefile you wouldn't have to remember the
specific command line options for rsync or to regenerate the site each
time:

```ruby
task :deploy do
  sh "jekyll --no-auto"
  user = 'your_nfsn_ssh_login'
  server = 'ssh.phx.nearlyfreespeech.net'
  sh "rsync -icrz --delete _site/ #{user}@#{server}:/home/public"
end
```

And each time you wanted to deploy you'd type:

{% highlight console %}
$ rake deploy
{% endhighlight %}

## Resources

* The [Jekyll Deploy Wiki][jekyll-deploy] discusses rsync.
* Nathan Grigg has a blog entry all about
  [rsyncing with jekyll][nathan-rsync-jekyll] which, in particular,
  revealed the notion of rsync's ```--checksum```

[nearlyfree]: https://www.nearlyfreespeech.net/
[jekyll]: https://github.com/mojombo/jekyll
[jekyll-deploy]: https://github.com/mojombo/jekyll/wiki/Deployment
[git]: http://git-scm.com/
[nathan-rsync-jekyll]: http://nb.nathanamy.org/2012/04/rsyncing-jekyll/
