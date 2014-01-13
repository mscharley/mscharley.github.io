---
title: Using PulseAudio and multiple sound devices
date: 2012-03-30 11:11:02
updated: 2012-04-11 15:44:02
layout: post
tags:
- linux
- pulseaudio
- sound
priority: 0.7
---

**DISCLAIMER**: Most of this post was cobbled together from this [related question on Super User][su-post],
but I had some extra flavour of my own to add. If you found this useful, you should
jump over there and vote them up too.

PulseAudio does support using multiple devices at the same time, but when I bought my
speakers the other day, I had trouble finding documentation that said much more than
that it was supported.

The Problem
-----------

I have a nice set of 2.1 speakers that I wish to use for almost everything, but I use
Skype and Mumble for VOIP with various people, and I want to use my headset with those
applications. Skype in particular will only let you chose "PulseAudio" if it detects
that PulseAudio is available.

The Solution
------------

PulseAudio allows you to control input and output devices on a per-application basis,
but as far as I've found, it only lets you control these through setting environment
variables; `PULSE_SINK` and `PULSE_SOURCE`. You can get values for these variables
from the following command lines:

``` console
$ LANG=C pactl list | grep -A2 'Source #' | grep 'Name: ' | cut -d" " -f2
$ LANG=C pactl list | grep -A2 'Sink #' | grep 'Name: ' | cut -d" " -f2
```

Using the info from the above commands, I made the following script:

``` sh
#!/bin/sh
# ~/bin/pa-headphones

export PULSE_SINK="alsa_output.usb-045e_Microsoft_LifeChat_LX-3000-00-LX3000.iec958-stereo"
export PULSE_SOURCE="alsa_output.usb-045e_Microsoft_LifeChat_LX-3000-00-LX3000.iec958-stereo.monitor"

# Export a normalish PATH so `which` doesn't pick up this script
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

exec $(which $(basename $0)) $*
```

I can then create as many symlinks to this script in my `~/bin` directory as I like
and they will all use my headset for sound input and output. So, for instance:

``` console
$ cd ~/bin
$ ln -s pa-headphones skype
```

And now, whenever skype is run it will use my headphones. This will also work for
`.desktop` shortcuts, as long as they don't use absolute paths to find their
executables. Most system-installed ones don't seem to, on Gentoo at least.

[su-post]: http://superuser.com/q/182149/5313
