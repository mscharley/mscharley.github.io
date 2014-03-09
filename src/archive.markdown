---
layout: default
title: Blog posts
change_frequency: weekly
---

{% for post in site.posts %}
* <time datetime='{{post.date | date: "%Y-%m-%d"}}'>{{post.date | date: "%d/%m/%Y"}}</time> [{{ post.title }}]({{ post.url }}){% endfor %}
