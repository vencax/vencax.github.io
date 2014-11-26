---
layout: blog
category: tips
published: true
splash: "http://placehold.it/1600x500"
title: Migration of postgres 8.4 to 9.1
tags:
  - postgress
  - tips
---

Yesterday I have upgraded postgress server packages on my server.
It has not started anymore so I have begun searching why.
The log told me that I use data created for old version of postgress.
So the migration journey begun.

The migtration tool [pg_upgrade](http://www.postgresql.org/docs/9.2/static/pgupgrade.html)
wanted several directories as params but after upgade of pg server the "old_bindir" did not exist.
You have downloaded the old packages and extract them to get the "old_bindir":

  DEB_URL=`search google for package for your distro and version`
  wget $DEB_URL -O postgre8.4.deb
  OLD_PACK=/tmp/pg-old
  mkdir $OLD_PACK
  dpkg-deb -R postgre8.4.deb $OLD_PACK

Now you need create 8.4 environment (the configs in /etc/postgres).
Magic tool is used for that:

  . /usr/share/postgresql-common/maintscripts-functions
  configure_version 8.4

this creates /etc/postgresql/8.4/ where configs compatible with old ver resides.
You have to make some changes to old server config (/etc/postgresql/8.4/main/postgresql.conf):
change data_directory to folder where your backuped data dir is.
And change the port to another value that the new server occupy.

Now find out what locale was the old data created with and pass it to initdb.
In my case it was (run under postgres user!):

su postgres
/usr/lib/postgresql/9.3/bin/initdb --locale=en_US.UTF-8

Now you have new datadir and you can start migration:

  su postgres
  cd /var/lib/postgresql
  /usr/lib/postgresql/9.3/bin/pg_upgrade \
    -b $DEB_URL/usr/lib/postgresql/8.4/bin/ -B /usr/lib/postgresql/9.3/bin/ \
    -d data.old/main/ -D 9.3/main/

Hopefully now you have successfuly migrated all the data.
