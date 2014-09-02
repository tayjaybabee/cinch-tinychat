require 'cinch'
require 'open-uri'
require 'nokogiri'
require 'cgi'

module Cinch
  module Plugins
    class TinyChat
      include Cinch::Plugin

      set :plugin_name, 'tinychat'
      set :help, <<-USAGE.gsub(/^ {6}/, '')
      The TinyChat plugin will query the room you ask it to and return with information on it.
      * !(tinychat|tc) <room>: The bot will return with room information.
      USAGE

      match /tinychat (.+)/
      match /tc (.+)/

      def execute(m, room)
        tcLogo = "0,12TinyChat"
        query  = URI::encode(room)
        doc    = Nokogiri::XML(open("http://tinychat.apigee.com/#{query}.xml").read)

        online       = doc.css("names").collect{|j| j.inner_text}.join(', ')
        onlineCount  = doc.root["total_count"]
        roomName     = doc.root["name"]

        url = "http://tinychat.com/#{roomName}"

        onlineCount = onlineCount.to_i

        if doc.root["message"]
          begin
            eMessage = doc.root["message"]
            raise "Error: #{eMessage}"
          rescue
            m.reply "#{tcLogo} || I have been given an error of: \"#{$!}\"! Please contact my master."
          end
          return
        end

        m.reply "There's #{onlineCount} user in #{roomName}. | User: #{online} | #{tcLogo} URL: #{url}" if onlineCount == 1

        m.reply "There's #{onlineCount} users in #{roomName}. | Users: #{online} | #{tcLogo} URL: #{url}" if onlineCount >= 2

        m.reply "There are no users in #{roomName}. | #{tcLogo} URL: #{url}" if onlineCount == 0
      end
    end
  end
end
