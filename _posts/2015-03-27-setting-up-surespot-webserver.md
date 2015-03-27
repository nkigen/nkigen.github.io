---
layout: post
title: Setting Up Surespot Server on Ubuntu 14.04
---

[https://www.surespot.me/](Surespot) is a relatively new Open Source instant messaging app thats fully
opensource. Therefore both the source codes for the client(Android and iOS) and the Server(Node.js) is
available.

In this post, I'll describe a step-by-step procedure for setting up the Surespot server on Ubuntu(I've
tried it with Ubuntu 14.04 Server Edition).


1. Install [Cassandra](http://en.wikipedia.org/wiki/Apache_Cassandra) and [Redis](http://en.wikipedia.org/wiki/Redis) database servers.  
  -To install the DataStax's Cassandra 2.0 , follow the folowwing [instructions](https://www.datastax.com/documentation/cassandra/2.0/cassandra/install/installDeb_t.html)
  -Install Redis server using apt-get:
{% highlight bash %}
sudo apt-get install redis-server
{% endhighlight %}
