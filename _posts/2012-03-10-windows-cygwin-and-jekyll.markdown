---
title: Windows, Cygwin and Jekyll
layout: post
updated: 2012-06-08 11:54:00
tags:
- cygwin
- windows
- jekyll
priority: 0.7
---

A bit of background
-------------------

My main computer is a dual-boot Gentoo/Windows 7 box. I use Linux for work, and most
of my every day stuff. Windows is mainly just for games and certain other members of
the household.  I've also recently reformatted, so both are near-clean slates.

Enter the Jekyll blog
---------------------

Jekyll is a great system. It fits well into that "just enough" category. My last blog 
was a Drupal blog, but I used Markdown to write all my posts. It always struck me as
a very elegant way to edit HTML. With a good text editor that has some color coding
for formatting, you barely notice the difference... except you can't screw up the tags.
As someone who works in the web industry, I regularly see and use CKEditor, and also
regularly see it chew up code from [a certain Microsoft product][msword] that clients
love and spit out HTML that wreaks havoc on designs. Markdown and similar systems like
Textile always produce very predictable results, and you can tell at a glance what
those results will be.

And so, tonight I got onto my computer, and it was booted into Windows. I wanted to
hack on my blog for a bit. So I did what every Linux guy does first in Windows: 
[Cygwin][cygwin] and Console2. Now, before I go any further, please don't misunderstand;
I love Cygwin. In much the same way that I love beating my head against a wall, because 
it's often much the same feeling. However I do have a great respect for the people behind
this project, because it's a great project, and when it's setup and working, it
really is a wonderful things to have around.

How to get Jekyll working on Cygwin
-----------------------------------

First, a list of things you will need, in order. If you can follow this list on your
own, then the rest of this article should be redundant.

*   [Cygwin][cygwin], optionally [Console2][console2]

    *   Devel
        * gcc4
        * gcc4-g++
        * git
        * make

    *   Libs
        * libiconv
        * libiconv2
        * zlib

    *   Net
        * curl

    *   Python
        * python (only if you need/want Pygments)

*   [RVM][rvm]
    * ruby-1.9.\*

* posix-spawn gem - [from source][gh-posix-spawn]
* jekyll gem - from rubygems
* Python [setuptools][setuptools]
* [Pygments][pygments]

First, install Cygwin with the above packages by using the `setup.exe` executable
available on their homepage. It's important to get both `iconv` *and* `iconv2`. If
you don't, then RVM will happily and silently compile ruby without iconv support, and
then Jekyll will happily install but promptly fall on it's face when you try to run
it.

Oops.

Next on the list is [RVM][rvm]. There's installation instructions on their homepage,
but it boils down to the following:

``` console
$ curl -L https://get.rvm.io | bash -s stable --ruby
$ source ~/.rvm/scripts/rvm
```

Here's the hard part. Once you have `ruby` and `gem`, you need to install
`posix-spawn`. There is a bug in the version of `posix-spawn` in the the gem
repositories however that makes installing via `gem` impossible on Cygwin.
There was a bug fix, but seems it never made it into the repos. So, go clone
`posix-spawn` and install it manually.

``` console
$ gem install rake-compiler -v 0.7.6
$ git clone git://github.com/rtomayko/posix-spawn.git
$ cd posix-spawn
$ rake gem
$ gem install pkg/posix-spawn-0.3.6
```

Once `posix-spawn` is installed, you can happily `gem install jekyll`, and it should
just fall into place. If you want or need pygments support, then installing it is
simple, you just need to install setuputils manually first.

``` console
$ curl -L http://peak.telecommunity.com/dist/ez_setup.py | python
$ easy_install Pygments
```

And we're done at this point. Congratulations! You can now edit your Jekyll blog on
Windows using the latest version of Jekyll.

[console2]: http://sourceforge.net/projects/console/
[cygwin]: http://www.cygwin.com/
[gh-posix-spawn]: https://github.com/rtomayko/posix-spawn/tree/
[msword]: http://en.wikipedia.org/wiki/Microsoft_Word
[pygments]: http://pygments.org/download/
[rvm]: http://beginrescueend.com/
[setuptools]: http://peak.telecommunity.com/dist/ez_setup.py
