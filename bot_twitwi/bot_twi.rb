load 'choperHandleInSpread.rb'
load 'followTwitter.rb'


# POUR TAB HANDLES DU SPREADSHEET
objHandle = TakeHandlesInSpread.new
tab_handle = objHandle.choper

# POUR FOLLOW
bot = FollowTwitter.new
bot.follow(tab_handle)