---
title: Debugging UNIX sockets with socat
date: 2012-03-19 10:02:01
updated: 2012-03-23 13:41:01
layout: post
tags:
- socat
- networking
- unix sockets
priority: 0.7
---

A while ago, I came across an interesting problem: how do you listen in on 
UNIX sockets? For IP, there are tools like wireshark that will display in
great detail all the network traffic that go through your system, but these
tools can't listen in on UNIX sockets.

Introducing socat
-----------------

So, what is `socat`?

> **Socat** is a command line based utility that establishes two bidirectional
> byte streams and transfers data between them. Because the streams can be
> constructed from a large set of different types of data sinks and sources
> (see address types), and because lots of address options may be applied to
> the streams, socat can be used for many different purposes.
>
> *-- [socat manpage][man socat]*

In other words, socat sits in the middle of two different sources of IPC
and passes data between them. I use the term IPC because `socat` understands
so many different formats that it is a little rediculous. It can process and
translate between the following formats (not even close to 
[a comprehensive list][socat protocols]):

* TCP with or without SSL
* UNIX sockets
* regular files
* stdin/stdout of another process

As you can see, it's very flexible. It also supports logging all traffic that
flows through it. Which brings us back to our original point.

Debugging UNIX sockets
----------------------

UNIX sockets are great for all sorts of reasons, including ensuring that they
are only available locally. However, this also means that they are hard to
listen in on and debug. So, enter `socat`:

{% highlight console %}
$ socat -v UNIX-LISTEN:/tmp/socat-listen UNIX-CONNECT:/path/to/real.socket
{% endhighlight %}

Now, point the client application at `/tmp/socat-listen` instead of the real
socket and enjoy the conversation.

Or, if you wish to provide your own test data rather than simply listening in:

{% highlight console %}
$ socat -v READLINE UNIX-CONNECT:/path/to/real.socket
{% endhighlight %}

With this, `socat` will use readline to get data from the console, and print
back any replies.

In closing
----------

Obviously, this is only one way to use `socat`. It's a very powerful application,
and can be put to lots of good uses. This is just one of the more obscure things
you can do with it. You could even use it as a telnet replacement if you really
wanted to with the second example. You should explore the [man page][man socat]
to get other cool ideas.


[man socat]: http://www.dest-unreach.org/socat/doc/socat.html
[socat protocols]: http://www.dest-unreach.org/socat/doc/socat.html#ADDRESS_CREAT

*[IPC]: InterProcess Communication
