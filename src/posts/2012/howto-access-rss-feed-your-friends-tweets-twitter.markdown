This is a quick note to get some information back out in the public that
was lost when I moved my website. Hopefully that won't happen again now.

Quite a while back now Twitter disabled simple authentication. Apparently 
there were lots of people using the Twitter API directly in a basic RSS 
reader and requiring OAuth broke those peoples use-case for the API.

I created a web application in PHP which handles the OAuth for you and
exposes a set of obfuscated URL's that you can access without any 
authentication from any device. Sadly I'm not able to host a copy of this
any more, but [the code is still freely available][twitterrss-code] and it 
doesn't take much to host it yourself.

[twitterrss-code]: https://bitbucket.org/mscharley/twitter-rss
