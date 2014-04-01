# slack-post

Posts wercker build/deploy status to your [Pushover](https://pushover.net) app.

[![wercker status](https://app.wercker.com/status/49d7c3919df2d65ed4679bcc86eb3477/m "wercker status")](https://app.wercker.com/project/bykey/49d7c3919df2d65ed4679bcc86eb3477)

### Required fields

* `token` - Your Pushover [app token](https://pushover.net/apps).
* `user` - [Your user key](https://pushover.net/).

### Optional fields

* `device` - Define a specific device to receive the notifications (Default - all devices).
* `title` - Title for the push notification (default - `your app name`).

# Example

Add the following step to your `wercker.yml` (or use Pipeline variables instead):

    build:
        after-steps:
            - kobim/notify-pushover:
                token: $PUSHOVER_APP_TOKEN
                user: $PUSHOVER_USER_TOKEN
                title: dev # OPTIONAL
                username: builder # OPTIONAL

# License

The MIT License (MIT)

Copyright (c) 2014 Kobi Meirson

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Changelog

## 0.0.1
- First version
