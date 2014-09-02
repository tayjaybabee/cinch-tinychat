[![Gem Version](https://badge.fury.io/rb/cinch-tinychat.png)](http://badge.fury.io/rb/cinch-tinychat) [![Dependency Status](https://gemnasium.com/Namasteh/cinch-tinychat.svg)](https://gemnasium.com/Namasteh/cinch-tinychat) [![Build Status](https://travis-ci.org/Namasteh/cinch-tinychat.svg?branch=master)](https://travis-ci.org/Namasteh/cinch-tinychat) [![Coverage Status](https://coveralls.io/repos/Namasteh/cinch-tinychat/badge.png)](https://coveralls.io/r/Namasteh/cinch-tinychat)

### Authors
@doubledave
@Namasteh

### Files
tiny_chat.rb

### Dependencies
* [Cinch](http://rubygems.org/gems/cinch)
* OpenURI
* [Nokogiri](http://rubygems.org/gems/nokogiri)
* CGI

### Description
The _TinyChat_ gem (created for the Cinch IRC Bot Framework) is used to parse an XML API from apigee.com for TinyChat the browser chat client. Using it's commands you can have essential information of a TinyChat room returned to the channel.

### Installation
To install the gem:

> gem install cinch-tinychat

### Configuration
Firstly, the _TinyChat_ gem does not need an API key as it simply parses VML data from a link delivered through the bot.

Secondly, in order for this plugin to work you **must** load it into the bot. In most Cinch IRC bot formats you will do the following:

At the top of bot.rb put this line:
```ruby
require 'cinch-tinychat'
```

In the c.plugins section of bot.rb insert this:
```ruby
[Cinch::Plugins::TinyChat]
```

### Usage

The TinyChat plugin will query the room you ask it to and return with information on it.

* !(tinychat|tc) \<room\>: The bot will return with room information.
