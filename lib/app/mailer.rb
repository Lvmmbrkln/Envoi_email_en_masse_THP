require 'gmail'
require 'json'

class Mailer

	attr_accessor :pseudo, :mdp

	def initialize
		puts "Bienvenue dans la partie d'envoi d'emails"
		puts "Tout d'abord quel est votre prénom et votre nom ?"
		print "->"
		@name = gets.chomp.to_s
		puts "Ensuite, entrez votre adresse email sans @xxx.xx"
		print "->"
		@pseudo = gets.chomp.to_s
		puts "Enfin, entrez votre mot de passe"
		print "->"
		@mdp = gets.chomp.to_s
	end

	def sending_emails(email, content)

		gmail = Gmail.connect("#{@pseudo}", "#{@mdp}")

		gmail.deliver do
			to "#{email}"
			subject "Apprenez, Codez, Réussissez."
			html_part do
				content_type 'text/html; charset=UTF-8'
  				body "<p>#{content}</p>"
			end
		end
	end

	def getting_data

		data = []
		json_file = File.read('db/townhalls.json')
		data = JSON.parse(json_file)
		name_town = []
		email_town = []

		data.each do |towns_data|
			name_town << towns_data[towns_data.keys[0]]
			email_town << towns_data[towns_data.keys[1]]
		end
		puts email_town

		x = 0
		y = 0

		while x < 80 && y < 80
			@each_email = email_town[x]
			each_town_name = name_town[y]
			message = "Bonjour, Je m'appelle #{@name}.<br><br><br>Je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.<br><br><br>Déjà 500 personnes sont passées par The Hacking Project.<br>Est-ce que la mairie de #{each_town_name} veut changer le monde avec nous?<br><br><br>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06 95 46 60 80"

			sending_emails(@each_email, message)
			puts "Email envoyé à #{@each_email}."

			x = x + 1
			y = y + 1
		end

		puts "Terminé. Tous les emails ont été envoyés."
		puts "A bientôt #{@name}."

	end

end

all = Mailer.new
all.getting_data
