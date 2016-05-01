So, there's a new static site generator on the block. [It's called Usmu and it's my answer to the likes of Jekyll.][usmu]

Usmu is built from the ground up to be extensible and modifiable. It is not, as Jekyll is, designed to be used as a
secure public hosting solution though obviously the resultant HTML could safely be displayed via virtually any web
host.

I'm also making a very real effort to get it supported everywhere. To date, Usmu core and all core plugins like the S3
uploader all work on both Linux and Windows and should work on OS X (but I don't have anything available to test with).
If there's a compatibility issue then it's a bug.

Usmu is a Tilt API client. This means that [it automatically supports any template type that Tilt supports][tilt-support],
which is quite a lot. Out of the box Usmu ships with Slim for use with templates and Markdown via the redcarpet gem
(or Kramdown for the JRuby folks).

~~For the Github fans [there's already plans on making deploying to Github Pages simple][usmu-#33].~~ [Github Pages support is live!][usmu-github-pages]

If you're interested to see what an Usmu site looks like under the hood [you can check out the source for this website][msme].

  [usmu]: https://github.com/usmu/usmu
  [usmu-github-pages]: https://github.com/usmu/usmu-github-pages
  [tilt-support]: https://github.com/rtomayko/tilt#readme
  [usmu-#33]: https://github.com/usmu/usmu/issues/33
  [msme]: https://github.com/mscharley/mscharley.github.io
