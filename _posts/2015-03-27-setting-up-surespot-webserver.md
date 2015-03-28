---
layout: post
title: Setting Up Surespot Server on Ubuntu 14.04
---

[Surespot](https://www.surespot.me/) is a relatively new Open Source instant messaging app thats fully
opensource. Therefore both the source codes for the client(Android and iOS) and the Server(Node.js) is
available.

In this post, I'll describe a step-by-step procedure for setting up the Surespot server on Ubuntu(I've
tried it with Ubuntu 14.04 Server Edition).


- Download the Surespot web-server code from [github](https://github.com/surespot/web-server).  
- Install [Cassandra](http://en.wikipedia.org/wiki/Apache_Cassandra) and [Redis](http://en.wikipedia.org/wiki/Redis) database servers.  
  - To install the DataStax's Cassandra 2.0 , follow these [instructions](https://www.datastax.com/documentation/cassandra/2.0/cassandra/install/installDeb_t.html)  
  - Install Redis server using apt-get:
{% highlight bash %}
	sudo apt-get install redis-server
{% endhighlight %}

- Next you have to install Node.js, npm and CoffeeScript. The versions that worked for me were 0.10.18, 1.3.8 and 1.6.3 respectively  
  - Install Node.js and npm by following the steps from [here](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server).  
  - Next use npm to install Node version manager and then using the node version manager, change to version 0.10.18. The steps are available [here](https://www.npmjs.com/package/n)  
  - Install CoffeeScript using npm  
{% highlight bash %}
	npm install -g coffee-script@1.6.3
{% endhighlight %}

- Edit package.json file as follows:  
  - Use brypt version 0.8.1  

- On the root directory of the surespot server(&lt;PATH_TO_SERVER&gt;/web-server) run  

{% highlight bash %}
	npm install
{% endhighlight %}

This will install the dependencies for the project.  

- Assuming that the database servers are already running, setup the cassandra database by executing the following

{% highlight bash %}
	cqlsh -f server/cassandra_setup localhost
{% endhighlight %}

- Now create the following directories  
  - "ecLocal" and "logs" directory on "web-server/server". In the "logs" directory, create "surespot.log" file  
  - "sslLocal" in "web-server" directory  

- In the "ecLocal" directory using openSSL generate priv.pem file

- In the "sslLocal" directory generate surespot.{crt,csr,key} files  

- Set the environmental variables and then start the server.  


{% highlight bash %}
	coffee cluster.coffee
{% endhighlight %}  

The following is an example of the environmental variables to be set  

{% highlight bash %}
export SURESPOT_RATE_LIMITING_MESSAGE=false
export SURESPOT_RATE_LIMIT_SECS_MESSAGE=10
export SURESPOT_RATE_LIMIT_RATE_MESSAGE=100
export SURESPOT_RATE_LIMIT_BUCKET_MESSAGE=5

export SURESPOT_CORES=1
export SURESPOT_MESSAGES_PER_USER=10

export SURESPOT_DEBUG_LEVEL="debug"
export SURESPOT_DB=0
export SURESPOT_SOCKET=8080
export SURESPOT_ENV="Local"
export SURESPOT_GOOGLE_API_KEY=""
export SURESPOT_RACKSPACE_API_KEY=""
export SURESPOT_RACKSPACE_IMAGE_CDN_URL="gateway.sandbox.push.apple.com"
export SURESPOT_RACKSPACE_IMAGE_CONTAINER="imeage"
export SURESPOT_RACKSPACE_VOICE_CDN_URL="gateway.sandbox.push.apple.com"
export SURESPOT_RACKSPACE_VOICE_CONTAINER="voice"
export SURESPOT_RACKSPACE_USERNAME=""
export SURESPOT_SESSION_SECRET="+2blji1neE7MZQT+hw="

#export SURESPOT_REDIS_SENTINEL_PORT=26379
#export SURESPOT_REDIS_SENTINEL_HOSTNAME="127.0.0.1"

export SURESPOT_REDIS_SENTINEL_PORT=6379
export SURESPOT_REDIS_SENTINEL_HOSTNAME="127.0.0.1"

export SURESPOT_DONT_USE_SSL="true"

export SURESPOT_GOOGLE_CLIENT_ID=""
export SURESPOT_GOOGLE_CLIENT_SECRET=""
export SURESPOT_GOOGLE_REDIRECT_URL=""

export SURESPOT_TEST_BASEURI="http://127.0.0.1:8080"
export SURESPOT_TEST_CLEANDB="true"

export SURESPOT_GOOGLE_OAUTH2_CODE="670969345590"

export SURESPOT_USE_REDIS_SENTINEL="false"
export SURESPOT_APN_GATEWAY="gateway.sandbox.push.apple.com"
export SURESPOT_IAP_SECRET=""

export SURESPOT_CASSANDRA_IPS="127.0.0.1"
{% endhighlight %}  
