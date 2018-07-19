# FICHIER RUBY | BOT TWITTER
require "twitter"	  #
require "dotenv"	  #
Dotenv.load			  #
require "pry"		  #
require "google_drive"#
#######################

#-------------------- CONNEXION TWITTER ----------------------

# client = Twitter::Streaming::Client.new do |config|
client = Twitter::REST::Client.new do |config|
	config.consumer_key		  = ENV["consumer_key"]
	config.consumer_secret	  = ENV["consumer_secret"]
	config.access_token 	  = ENV["access_token"]
	config.access_token_secret = ENV["access_token_secret"]
end


#----------------- CONNEXION GOOGLE DRIVE ----------------------
# create session
session = GoogleDrive::Session.from_config("config.json")
# Afficher titre des documents du Drive
session.files.each_with_index do |file, i|
	puts "#{file.title} - #{i}"
end
# Upload file de : Ordinateur vers GoogleDrive
session.upload_from_file("/home/nancy/Images/jinx_chibi.jpg", "jinx_chibi_img.txt", convert: false)
# Download file de : GoogleDrive vers Ordinateur
file = session.file_by_title("correc_graphes.py")
# file.download_to_file("/home/nancy/graphes_a_sup.py")
# UPLOAD
#ajout sur drive
	# session.upload_from_file("/home/nancy/text_essai.txt", "text_a_supp.txt", convert: false)
#update
file2 = session.file_by_title("text_a_supp.txt")
file2.update_from_file("/home/nancy/text_essai.txt")