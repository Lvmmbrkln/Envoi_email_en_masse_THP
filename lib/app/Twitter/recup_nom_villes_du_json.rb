#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'


class RecupNameVille
	attr_accessor :tab_nom_ville


	def initialize
		@tab_nom_ville = []
	end

	def recup_nom
		# POUR LIRE LE FICHIER
		json = File.read('../../../db/townhalls.json')
		obj = JSON.parse(json)

		# POUR RECUPERER CHAQUE NOM DU HASH DANS LE fichier .JSON
		obj.each do |info_ville|
			tab_nom_ville << info_ville[info_ville.keys[0]]
		end
		return tab_nom_ville
	end

end


# obj_recup = RecupNameVille.new
# tab_nom_ville = obj_recup.recup_nom
# print tab_nom_ville, "\n"