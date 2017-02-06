# Coldstrap

[Bootstrap](http://getbootstrap.com) elements for the [Nitrogen Web Framework](http://nitrogenproject.com)

### Notes

The vast majority of the Coldstrap elements are copies of their respective
Nitrogen analogs with a few additional attributes. I will show which are which.

## Elements

To see the elements, check out `include/records.hrl` to see which elements are
added, and are extended versions of Nitrogen analogs.

## Functions

### modal

* `coldstrap:modal(Body)`
* `coldstrap:modal(Title, Body)`
* `coldstrap:modal(Title, Body, Footer)`
* `coldstrap:modal(Title, Body, Footer, Options)`

**Note:** `Options` is a proplist analog to the options presented in the
[Bootstrap Modal Docs](http://getbootstrap.com/javascript/#modals-options)

### confirm

**Note:** Below, the `Buttons` argument is expected to be a list of tuples, any
of the following are acceptable:

1. `{ButtonText, Postback}`
2. `{ButtonText, PostbackDelegate, Postback}`
3. Any valid Nitrogen element (e.g. `#btn{}`)

#### The confirm functions

* `coldstrap:confirm(Body)`
* `coldstrap:confirm(Body, CloseText)`
* `coldstrap:confirm(Body, Buttons, CloseText)`
* `coldstrap:confirm(Title, Body, Buttons, CloseText)`

### close_modal

* `coldstrap:close_modal()`

## Licence

Copyright 2016-2017 Jesse Gumm

MIT License
