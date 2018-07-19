require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'google_drive'

session = GoogleDrive::Session.from_config("townhalls.json")


@root           = "http://annuaire-des-mairies.com"
@url_reunion    = "http://annuaire-des-mairies.com/reunion.html"
@url_guyane     = "http://annuaire-des-mairies.com/guyane.html"
@url_martinique = "http://annuaire-des-mairies.com/martinique.html"

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
  # doc = Nokogiri::HTML(open(@url_guyane))
  # doc = Nokogiri::HTML(open(@url_martinique))
	doc.css(".lientxt").each do |link|
		#Scrapping de l'url de chaque mairie
		url = @root + link["href"][1..-1].to_s###decoupe le premir caractere de la chaine
		#Scrapping du nom de la ville
		ville_name   = link.text
		#Scrapping de l'adresse mail de la mairie
		ville_email  = get_the_email(url)
    ville_postal = get_the_postal(url)
		#Le tout stoqué dans un hash
		ville = {:name => ville_name, :email => ville_email, :postal => ville_postal}
		puts  ville
  end
end

 get_all_the_urls(@url_reunion)
 get_all_the_urls(@url_guyane)
 get_all_the_urls(@url_martinique)
