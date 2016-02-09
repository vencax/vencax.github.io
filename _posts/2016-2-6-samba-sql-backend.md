---
layout: blog
category: tips
published: true
title: Samba with SQL backend
tags: samba, sql
---

After long period I have finished another version of [eduit](/eduit/) project.
It uses SQL database as user storage because I believe that LDAP is pain in ..
Server uses libnssmysql for user SAM, but samba has its own user backend, FUUU!

So only way (if you don't want use LDAP) is to use the build in tools for user management - [smbpasswd](https://www.samba.org/samba/docs/man/manpages-3/smbpasswd.8.html) and [pdbedit](https://www.samba.org/samba/docs/man/manpages/pdbedit.8.html).
This tools are run from hooks of [eduit-userman](https://github.com/vencax/node-eduit-userman/).
It is backend part of administration. The frontend is [angular-eduit](https://github.com/vencax/angular-eduit).
The whole is SPA (Single Page Application), everything runs smoothly and fast.
I could be satisfied but as a next stage I would like to [dockerify](http://docker.io) all.

For dockerisation of samba server could be handy if samba could get the users directly from SQL database instead of replication existing database into saba through the tools.
I have found [pdbsql](http://pdbsql.sourceforge.net/) that is cut-away part of samba.
From [mailing list](https://lists.sourceforge.net/lists/listinfo/pdbsql-users) I have got this info from __Herwin Weststrate__:

> .. The code has been updated for Samba releases in the 3.x-branch. ..
.. Samba 4 is not supported, that has been a complete rewrite of the core
and I couldn't really find where it stored the users in the four minutes
I tried looking at them. I know S4 has a Python-interpreter embedded
into it, so I'm hoping that instead of compiling a plugin it would be
possible to just load a python script of a few lines that fetches users
from a database. ..

His latest code is [HERE](https://github.com/herwinw/pdbsql).
I thing I would rather use the user replication through the samba tools scenario.
Or has anybody gone further then me on this topic?
Comments welcome on FB or mail.
