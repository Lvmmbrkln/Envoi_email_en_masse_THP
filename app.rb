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
require 'lib/app/townhalls_scrapper'
require 'lib/twitter'
require 'lib/mailler'

MyClass.new.perform
