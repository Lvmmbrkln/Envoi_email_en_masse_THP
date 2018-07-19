load 'choperHandleInSpread.rb'
load 'followTwitter.rb'



def go_bot
	# POUR SCRAPPER LES @ DES MAIRIES
	puts "[.........................]"

	# POUR TAB HANDLES DU SPREADSHEET
	objHandle = TakeHandlesInSpread.new
	tab_handle = objHandle.choper

	# POUR FOLLOW
	bot = FollowTwitter.new
	bot.follow(tab_handle)

end

go_bot