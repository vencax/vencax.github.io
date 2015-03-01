---
layout: blog
category: tips
published: true
title: Tus.IO resumable file uploads with angular
tags: node, angular
---


Last week I had a special task. I had to implement file uploading.
Well, you might say, what is so special about that?
So, I has to be able to upload huge files (GBs) in reliable and background manner.
I use angular.js for the client side so I searched for a solution that has no dependency (like JQuery).

So I need something that:

- can upload file in chunks
- can resume upload ofter connection loss (user does not want to reupload 50GB file after connection loss in 99% :)
- can run without user interaction and can run in background
- does not have any dependency on libs that I do not need

I found [tus.io](http://tus.io/), a protocol that meet the first 2 requirements.
There are already some implementation but no angular specific.
That is why I wrote [angular-tus-io](https://github.com/vencax/angular-tus-io).
It uses angular $http service and HTML5 File API for chunk creation.

Node.js is on server so I firstly looked at [brewtus](https://github.com/vayam/brewtus).
But I did not like structure of code so I have rewritten it as well.
Now it can be used as [express](http://expressjs.com/) application.
It has some other features.
E.g. you can say what filename to store particular file under on server.
Check it out on [github.com/vencax/brewtus](https://github.com/vencax/brewtus).
