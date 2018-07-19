require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pry'
require "google_drive"
require 'twitter'
require 'csv'

require 'bundler'
Bundler.require

# Chemins
load 'lib/app/scrapper.rb'
load 'lib/app/Tweets/twitters.rb'
load 'lib/app/mailer.rb'

# scrapper.new.perform
mailer.new.perform
# twitter.new.perform

