---
title: Creating Inline SVG backgrounds with PNG sprites as fallbacks using Compass
date: 2013-11-02 17:21:00
layout: post
tags:
- compass
- sass
- svg
---

Hey everyone, just thought I'd share a quick mixin I created for this website while doing the new social media buttons.

``` scss
@import 'sprites/*.png';
@mixin svg-background($img) {
  .no-svg & {
    @include sprites-sprite($img);
    background-size: auto auto;
  }
  background-image: inline-image($img + ".svg");
  background-size: sprites-sprite-width($img) sprites-sprite-height($img);
}
```

So what does this little baby do? Well, it sets up a background image that is either an inline SVG image, or a segment
of a PNG sprite depending on the capabilities of your browser. All images live separately for easy editing and all
sizing is done automatically to the size of the png. This allows your master SVG image to be any size you wish. Compass
automatically handles stitching together a PNG sprite for us and also tackles inlining and encoding the SVG asset for
us as well.

This technique does rely on having something like [Modernizr][modernizr] available and doing at the very least SVG
detection so that we can automatically switch methods in CSS. Unfortunately this is required as some of the properties
conflict with each other such as `background-size` and `background-position`.

**Example usage:**

``` scss
a {
  width: 32px;
  height: 32px;
  display: block;
}

@each $site in github, bitbucket, google-plus, linkedin, stackoverflow, twitter {
  a.#{$site} {
    @include svg-background(quote($site));
  }
}
```

**Produces:**

``` css
.no-svg section#social a.github,
.no-svg section#social a.bitbucket,
.no-svg section#social a.google-plus,
.no-svg section#social a.linkedin,
.no-svg section#social a.stackoverflow,
.no-svg section#social a.twitter {
  background-image: url('/images/sprites-sfa80a12e72.png'); background-repeat: no-repeat;
}

section#social a {
  width: 32px;
  height: 32px;
  display: block;
}
section#social a.github {
  background-image: url('data:image/svg+xml;base64,<base64 string>');
  background-size: 32px 32px;
}
.no-svg section#social a.github {
  background-position: 0 -32px;
  background-size: auto auto;
}
section#social a.bitbucket {
  background-image: url('data:image/svg+xml;base64,<base64 string>');
  background-size: 32px 32px;
}
.no-svg section#social a.bitbucket {
  background-position: 0 0px;
  background-size: auto auto;
}
/* etc... */
```

Thoughts? Comments? Leave them below. And now I have pretty social media links on the right hand side of the screen, so
please feel free to contact me there as well.

  [modernizr]: http://modernizr.com/
