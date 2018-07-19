   #
require "dotenv"      #
Dotenv.load           #
require "google_drive"#
#######################

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
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
        error = false
        tab_handle.each_with_index do |someone, i|

            rescue ActiveResource::ClientError => e
             # Not 100% if we need to check for code method, I think I saw a NoMethodError...
            raise unless !retried && e.response.respond_to?(:code) && e.response.code.to_i == 429

            seconds_to_wait = (e.response[HTTP_RETRY_AFTER] || 2).to_i unless seconds_to_wait
            sleep seconds_to_wait

            retried = true
            retry
            

            begin
                @client.follow(someone.delete"@")
            rescue TooManyRequests => a
                error = true
            rescue NoMethodError => e
                error = true
            rescue NameError => b
                error = true
            else
                puts "error not found"
            end
            if error == false
                if someone != nil
                    puts "Follow réussi: #{someone}"
                end
                    if i!= (tab_handle.length)-1
                        # sleep 8
                    end
            end           
        end
    end
end
