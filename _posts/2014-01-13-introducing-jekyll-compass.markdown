---
title: Introducing jekyll-compass
date: 2014-01-13 21:14:00
layout: post
tags:
- compass
- sass
- jekyll
priority: 0.7
---

That's right, I wrote a plugin for Jekyll. Jekyll is the static site generator I use for this very website, and I was
sick of orchestrating Compass around Jekyll. Now, Compass sings to my own tune. Specifically, this is a generator plugin
for Jekyll which will take your directory of Sass or Compass files in a `_sass` folder inside your source folder and
output the results directly into your `_site` output folder. It will run automatically whenever your site is built by
Jekyll, so it will always be up to date. For example, a run of this site might look like this:

{% highlight console %}
$ jekyll build
Configuration file: D:/Websites/matt.scharley.me/_config.yml
            Source: D:/Websites/matt.scharley.me
       Destination: D:/Websites/matt.scharley.me/_site
Generating Compass: D:/Websites/matt.scharley.me/_sass => D:/Websites/matt.scharley.me/_site/css
identical _site/css/handheld.css
identical _site/css/ie8.css
identical _site/css/print.css
   remove images/sprites-s8bbc0e5b70.png
   create images/sprites-s8bbc0e5b70.png
identical _site/css/style.css

      Generating... done.
{% endhighlight %}

I originally created this plugin back just before Jekyll 1.3 was released but it's gone through a few spurts of growth
and I now feel it's up to public usage. So please, if you are using either Compass or plain Sass then please give this
plugin a shot. If you are using simple Sass, then this plugin will allow you to easily manage `@import` properly with
full partial support; and if you do decide to upgrade to Compass at some point, well, you already have you simply need
to start using it. It's worth it, I promise.

[Issues to the issue queue please][gh-issues], but feel free to discuss this plugin below.


  [gh-issues]: https://github.com/mscharley/jekyll-compass/issues
