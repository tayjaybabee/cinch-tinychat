# -*- coding: utf-8 -*-
require 'rubygems'
require 'rake'

require 'rspec/core/rake_task'
task :default => :spec
RSpec::Core::RakeTask.new

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "cinch-tinychat"
    gem.summary = %Q{The TinyChat plugin will query the room you ask it to and return with information on it.}
    gem.description = %Q{The TinyChat plugin will query the room you ask it to and return with information on it.}
    gem.email = "namaste@rawrnet.net"
    gem.homepage = "http://github.com/namasteh/cinch-tinychat"
    gem.authors = ["Richard Banks"]
    gem.files = ["lib/**/*.rb", "README.rdoc", "LICENSE"]
    gem.add_dependency "cinch"
    gem.add_dependency "nokogiri"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
