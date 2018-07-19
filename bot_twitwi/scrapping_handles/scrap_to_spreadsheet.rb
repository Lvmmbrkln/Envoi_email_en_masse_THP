require "google_drive"

# CLASSE POUR METTRE LES PSEUDO TWITTER SCRAPER DANS LA FEUILLE SPREADSHEET
class ScrapToSpread
	attr_accessor :session

	def initialize
		# create session
		@session = GoogleDrive::Session.from_config("../config.json")
	end

	def spread(liste_pseudo_twitter)
		ws = @session.spreadsheet_by_key("1wVnUFiVutqLfGGZ2Tm_YLu3iXNfnfh0Ai1PMZAUr0CQ").worksheets[0]


		col = 4
		liste_pseudo_twitter.each_with_index do |pseudo,i|
			ws[i+1, col] = pseudo
			puts "Ajout pseudo #{pseudo}"
		end
		ws.save
	end
end


liste = ["@jean", "@miche", "@miche2", "@michou"]
go = ScrapToSpread.new
go.spread(liste)