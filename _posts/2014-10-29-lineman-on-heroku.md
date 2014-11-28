---
layout: blog
category: tips
published: true
title: Lineman on Heroku without buildpack
tags:
  - heroku
  - lineman
  - node.js
---

I have just deployed a [lineman app](http://linemanjs.com)
without [heroku buildpack](https://github.com/linemanjs/heroku-buildpack-lineman).
Maybe someone will find this handy. I have added Procfile with following content:

```
  web: lineman run
```

Next you have to add port setting into server configuration (config/application.js):

```
  server: {
    web: {
      port: process.env.PORT || 8000;
    }
  }
```

And finally you have change package.json - move lineman* from devDependencies to dependencies.
