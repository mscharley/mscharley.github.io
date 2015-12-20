---
title: Logical equivalences and the Drupal States API
date: 2012-05-14 14:34:33
layout: post
tags:
- drupal
- drupal-7
- drupal-states-api
- logic
---

We recently ran into a bug in our code with relation to the States API. We had
the following code:

``` php
<?php
$form['field_activity_pymt_dets']['#states'] = array(
  'visible' => array(
    '.form-item-field-activity-cost-und input[type=checkbox]:not(:first)' => array('checked' => true)
  ),
  'required' => array(
    '.form-item-field-activity-cost-und input[type=checkbox]:not(:first)' => array('checked' => true)
  )
);
```

The problem with this code is rather simple. It's asking the States API to look at
many checkboxes and show/require the current field if any single one of these is
checked. Due to a limitation of jQuery, and by extension the States API, this doesn't
actually work out. When this code is used on the client side the selector will be
executed, but only the value for the first element will be used when retrieving values
as per normal jQuery results.

So, how to convert this so that it works? We have two related issues here:

1.  Each checkbox must be addressed individually
2.  The States API only provides an `AND` relationship, there is no way to specify that
    you want an `OR` style comparison. This means that we can't simply expand the 
    selector given; that would require all checkboxes to be checked, not any single one.

Well, the solution is to invert the logic so that there is an `AND` relationship in
effect. Hence, the following resultant code:

``` php
<?php
$options_lang = $form['field_activity_cost']['#language'];
$options = array_keys($form['field_activity_cost'][$options_lang]['#options']);
array_shift($options); // Drop the first option on the floor because we don't care about it (free).

foreach ($options as $id) {
  $selector = ':input#edit-field-activity-cost-'.$options_lang.'-'.$id;
  $form['field_activity_pymt_dets']['#states']['invisible'][$selector] = array('unchecked' => true);
  $form['field_activity_pymt_dets']['#states']['optional'][$selector] = array('unchecked' => true);
}
```

This does the same thing, but works slightly more counterintuitively. `Make visible if any
one of these is checked` is the same as `Make invisible if all of these are unchecked`.

