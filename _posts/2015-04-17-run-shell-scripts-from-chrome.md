---
layout: post
comments: true
title: run shell scripts from chrome
---
For linux users, it may be interesting to pass data directly from the browser to shell scripts. I've been looking for a way to do
this for a while now: I even thought of writing something from scratch until I came across a powerful tool [shellac](https://github.com/acg/shellac)
which is a chrome extension plus a python script which acts as a local server.  
With this tool, interesting things such as downloading stuff(I mean "hidden" stuff like video links from video-hosting sites) by just right clicking on the links, sending bookmarks to a command-line based bookmarking utility and anything else you can do using a script is possible.  
I've created a fork to add some more features to the tool such as pushing requests automatically to the [ZeinArmy](https://github.com/nkigen/ZeinArmy) tool. 
