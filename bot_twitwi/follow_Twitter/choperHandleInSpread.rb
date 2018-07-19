# https://docs.google.com/spreadsheets/u/2/d/1wVnUFiVutqLfGGZ2Tm_YLu3iXNfnfh0Ai1PMZAUr0CQ/edit?usp=drive_web&ouid=117236375821473198591
require 'google_drive'

class TakeHandlesInSpread
	attr_accessor :session, :ma_worksheet, :tab_handles

	def initialize
		@session = GoogleDrive::Session.from_config("config.json")
		@ma_worksheet = @session.spreadsheet_by_key("1wVnUFiVutqLfGGZ2Tm_YLu3iXNfnfh0Ai1PMZAUr0CQ").worksheets[0]
		@tab_handles = []
	end

	def choper
		puts "-"*45, "\tLIRE LA COLONNE DE HANDLES ", "-"*45

		ligne = 1
		while @ma_worksheet[ligne,4] != ""
			@tab_handles << @ma_worksheet[ligne,4]
			ligne += 1
		end
		return @tab_handles
	end

end


# # POUR RECUPERER LE TABLEAU DE HANDLES faire::
# objHandle = TakeHandlesInSpread.new
# tab = objHandle.choper
# # print tab