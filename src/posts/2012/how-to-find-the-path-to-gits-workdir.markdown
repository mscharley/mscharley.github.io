For a while now, I've wanted to add git's working directory to my prompt. My work is such
that I have many similar git repositories on my PC (multiple installations of [Drupal][drupal]).
Often, I find myself wading through at least two of them at once which quickly leads to
confusion about which windows are in which project. Since forever, I've had my projects
laid out in reasonable folders like `~/htdocs/project`, however I was lacking a good way
to get at that project name.

**Update:** Since I wrote this post, I've found a built-in command to do this. I now have both
methods aliased, since sometimes you don't want/need an error and you always want a folder name.

The solution
------------

``` console
$ git config 'alias.workdir' 'rev-parse --show-toplevel'
$ git config 'alias.workdir-or-cwd' '!echo $PWD'
$ git workdir
$ git workdir | xargs basename     # only get project name
```

Yep, it's that stupidly straightforward. Aliases are always run from the root of your
workdir so this will always work perfectly. Unfortunately, you can't simply try to read
`core.workdir` because that will only return something if it is explicitly set in 
`.git/config`. Hopefully this will help someone else out.

[drupal]: http://drupal.org/
