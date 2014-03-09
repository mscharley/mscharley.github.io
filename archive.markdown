---
layout: default
title: Blog posts
change_frequency: weekly
---

{% for post in site.posts %}
* {{ post.date | date_to_string }} - [{{ post.title }}]({{ post.url }}){% endfor %}
