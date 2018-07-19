require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'google_drive'

session = GoogleDrive::Session.from_config("townhalls.json")


  @url_reunion    = "http://annuaire-des-mairies.com/reunion.html"
  @url_guyane     = "http://annuaire-des-mairies.com/guyane.html"
  @url_martinique = "http://annuaire-des-mairies.com/martinique.html"

class Scrapper
  attr_accessor :root, :url_reunion, :url_guyane, :url_martinique, :tab

def initialize
  @root = "http://annuaire-des-mairies.com"
  @tab  = []
end
######################################################recupere les mails
def get_the_email(url)
	#ouverture de l'url du ste de la ville
	doc = Nokogiri::HTML(open(url))
	#scrapping du mail de la mairie
	doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end

def get_the_postal(url)
  #ouverture de l'url du ste de la ville
	doc = Nokogiri::HTML(open(url))
  #scrapping du postal de la ville
	doc.xpath("/html/body/div/main/section[3]/div/table/tbody/tr[1]/td[2]").text
end

#############################################################recupere les urls
def get_all_the_urls(lien)
	#Ouverture de l'url de l'annuaire des mairies du val d'oise
  doc = Nokogiri::HTML(open(lien))
  doc.css(".lientxt").each do |link|
    url = @root + link["href"][1..-1].to_s ###decoupe le premier caractere de la chaine
    ville_name   = link.text
    ville_email  = get_the_email(url)
    ville_postal = get_the_postal(url)
    @ville = {:name => ville_name.downcase.capitalize, :email => ville_email, :postal => ville_postal}
    @tab   << @ville
  end
end

def save()
  puts @tab
  File.open("townhalls.json","w") do |i|
    i.write(@tab.to_json)
  end
end
end

scrap = Scrapper.new
scrap.get_all_the_urls(@url_guyane)
scrap.get_all_the_urls(@url_reunion)
scrap.get_all_the_urls(@url_martinique)
scrap.save
