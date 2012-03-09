---
title: "[JS] HOWTO: Monkey patch IE for support for Function.name"
layout: post
tags:
- js
- javascript
- ie
---

One of the better [ways of detecting an object's type name in Javascript][so-name-of-object]
is `obj.constructor.name`. It's also the way that the Drupal states API does it.
Unfortunately, Internet Explorer doesn't support the non-standardised, though
rather standard [`Function.name`][Function.name] property.

So, here's how to monkey patch it into IE9 and above. IE8 doesn't support
[`defineProperty`][defineProperty] properly and earlier versions don't support 
it at all so those versions are still unsupported by this method.

{% highlight javascript %}
/**
 * Hack in support for Function.name for browsers that don't support it.
 * IE, I'm looking at you.
**/
if (Function.prototype.name === undefined && Object.defineProperty !== undefined) {
    Object.defineProperty(Function.prototype, 'name', {
        get: function() {
            var funcNameRegex = /function\s+(.{1,})\s*\(/;
            var results = (funcNameRegex).exec((this).toString());
            return (results && results.length > 1) ? results[1] : "";
        },
        set: function(value) {}
    });
}
{% endhighlight %}

  [so-name-of-object]: http://stackoverflow.com/a/332429/15537
  [Function.name]: https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Function/name
  [defineProperty]: https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Object/defineProperty
