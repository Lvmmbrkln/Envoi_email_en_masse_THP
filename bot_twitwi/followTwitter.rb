require "twitter"      #
require "dotenv"      #
Dotenv.load              #
require "pry"          #
require "google_drive"#
#######################

#-------------------- CLASSE POUR FOLLOW GENS DANS LISTE ----------------------
class FollowTwitter

    attr_accessor :client

    def initialize
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key          = ENV["consumer_key"]
            config.consumer_secret      = ENV["consumer_secret"]
            config.access_token       = ENV["access_token"]
            config.access_token_secret = ENV["access_token_secret"]
        end
    end

    #Follow les gens sur la liste
    def follow(tab_handle)
        tab_handle.each do |someone|
            @client.follow(someone.delete"@")
            puts "Follow réussi: #{someone}"
            sleep 87
        end
    end
end

