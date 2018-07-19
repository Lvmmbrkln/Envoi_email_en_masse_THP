require_relative 'recup_nom_villes_du_json.rb'
require_relative 'choper_handles_sur_internet.rb'
require_relative 'follow_gens_sur_twitter.rb'
require_relative 'enter_handles_in_json.rb'

class Twitters

	def initialize
	end


	def lancer_bot
		# RECUPERE LE NOM DES VILLES du json DANS UN TABLEAU
		obj_de_scrap = RecupNameVille.new
		tab_nom_ville = obj_de_scrap.recup_nom
		print tab_nom_ville, "\n"

		# RECUPERE LES HANDLES sur internet GRACE AU TABLEAU DE NOM DE VILLE
		obj_de_handle = Testy.new(tab_nom_ville)
		tab_all_handles = obj_de_handle.get_all_handle
		print tab_all_handles, "\n"

		# PERMET DE RENTRER LES HANDLES DANS LE FICHIER .JSON
		obj_pour_save_handle = EnterHandle.new
		fichier_de_base = obj_pour_save_handle.recup_fichier

		new_hash = obj_pour_save_handle.modif_hash(fichier_de_base, tab_all_handles)
		obj_pour_save_handle.save_in_json(new_hash) 
		

		# PERMET DE FOLLOW TOUTES PERSONNE QU'Y EST DANS LE TABLEAU DE HANDLES
		obj_pour_follow = FollowTwitter.new
		obj_pour_follow.follow(tab_all_handles)

		
	end
end


obj1 = Twitters.new
obj1.lancer_bot


