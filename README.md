# jedcn.com

http://jedcn.com is powered by [Octopress](http://octopress.org/).

If you cared to look back in the history of this git repository, you'd
see that it started with Zach Holman's
[Left](https://github.com/holman/left) and then shifted over to
Octopress.

At any rate-- if you take away all of the files that Octopress brings
to the table, what's original to jedcn.com is likely in the
`source/_posts` directory.

As of the time of this writing, there are four posts. Not wee
impressive.

## Hosting

http://jedcn.com itself is hosted on
https://www.nearlyfreespeech.net/.

I recommend it! They seem decent and the setup is low key.

By low key, I mean that I build this massive "site" on my laptop and
rsync it up with a Rake task that's like:

```ruby
desc 'Publish the latest code to NFSN'
task :nfsnpublish do
  sh "rake generate"
  user = 'your_user'
  server = 'ssh.phx.nearlyfreespeech.net'
  sh "rsync -icrz --delete public/ #{user}@#{server}:/home/public"
end
```

All Best,

Jed Northridge
Cambridge, MA
June 25th, 2013
