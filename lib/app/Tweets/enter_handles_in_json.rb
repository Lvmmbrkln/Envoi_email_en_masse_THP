#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'


class EnterHandle
	attr_accessor :tab_base, :hash_modif


	def initialize
		@tab_base = []
		@hash_modif = []
	end

	def recup_fichier
		puts "je recup le fichier"
		json = File.read('db/townhalls.json')
		obj = JSON.parse(json)
		# POUR RECUPERER FICHIER DE BASE
		obj.each do |info_ville|
			@tab_base << info_ville
		end
		return @tab_base
	end

	def modif_hash(mon_hash, tab_handle)
		# POUR RAJOUTER CHAQUE HANDLE A SA MAIRIE
		mon_hash.each_with_index do |info_ville, i|
			info_ville["twitter"] = tab_handle[i]
		end
		return mon_hash
	end

	def save_in_json(mon_hash)
		File.open("db/townhalls.json","w") do |file|
			file.write(mon_hash.to_json)
		end
	end

end


# tab_de_handle = ["@ville_chaville", "@ville_sevres", "@Paris", "@vdavray"]

# obj_pour_save_handle = EnterHandle.new
# fichier_de_base = obj_pour_save_handle.recup_fichier
# puts "\tFICHIER DE BASE:"
# puts fichier_de_base, "\n"

# puts "\tNOUVEAU FICHIER:"
# new_hash = obj_pour_save_handle.modif_hash(fichier_de_base, tab_de_handle)
# puts new_hash

# puts "\tSAUVEGARDE DU FICHIER DANS LE JSON:"
# obj_pour_save_handle.save_in_json(new_hash)