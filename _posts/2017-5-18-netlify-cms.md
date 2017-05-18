---
layout: blog
category: tips
published: true
title: Netlify CMS
tags: cms, github
---

I have discovered [Netlify CMS](https://www.netlifycms.org/), great CMS application for statically generated webs.
It's build with react and [redux](http://redux.js.org/) (pitty, I prefer [MobX](https://mobx.js.org/), but :),
is modularized, already has build in support for github-pages based web
and most important is fact that it can be compiled and the resulting files can put next to your pages and be served as another page of your web.

I instantly knew that this is the one I want to continue with as an admin for my party webs.
I wanted to allow users to authenticate with their github accounts, but Netlify did't have support for 3rd party OAuth providers ([learn more here](https://developer.github.com/v3/oauth/)).
It allows you to create account in their app, connect your repository with the web and let them to serve it via their fast CDN network.
But I didn't need serving via other service.
I just needed to let users edit the webs with knowing nothing about GIT.
That is why I wrote [netlify-cms-github-oauth-provider](https://github.com/vencax/netlify-cms-github-oauth-provider).

So if you want to have the same, you need:

- setup new OAuth application in you github account or organisation (see section [Using an Authentication Provider](https://www.netlify.com/docs/authentication-providers/)).
  With this you will get CLIENT_ID and CLIENT_SECRET.
- run your own instance of [netlify-cms-github-oauth-provider](https://github.com/vencax/netlify-cms-github-oauth-provider)
  and provide CLIENT_ID and CLIENT_SECRET as environment variables.
  See [installation & config](https://github.com/vencax/netlify-cms-github-oauth-provider#installation--config).
  I have used heroku for running my instance:
  ```
  cd <folder with netlify-cms-github-oauth-provider>
  heorku create myownghuboauthprovider
  git push heroku master
  heroku config:set OAUTH_CLIENT_SECRET=secret \
  OAUTH_CLIENT_ID=yourID
  # this is maybe redundant (but not a big deal to set it)
  heroku config:set REDIRECT_URL=https://myownghuboauthprovider.herokuapp.com/callback
  ```
- set Authorisation callback URL [in github settings](https://github.com/settings/developers) to URL where your instance listens.
  In this case heroku instance https://myownghuboauthprovider.herokuapp.com/callback.
- set base_url in backend section of your Netlify CMS config.yml (see. [example](https://github.com/pirati-web/admin/blob/master/config.yml))

And thats it. Easy. Now the [czech pirate party](https://www.pirati.cz/) members can edit the websites without any knowledge about GIT ;)
Thanks Netlify guys for amaizing CMS!
