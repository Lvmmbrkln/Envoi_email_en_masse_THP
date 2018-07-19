require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'


class Testy
	attr_accessor :url_base, :tab_villes

	def initialize(tab)
		@url_base = "https://duckduckgo.com/?q=twitter+"
		@tab_villes = tab
	end

# ID    ===> #
# class ===> .
	def get_handle(ville)
		if ville.split.length == 1
			lien = "https://www.google.com/search?source=hp&ei=sIFQW8WiMISA6QTblLHAAQ&q=twitter+#{ville}&oq=twitter+#{ville}&gs_l=psy-ab.3..35i39k1j0i22i30k1l5.905.3801.0.3942.15.14.0.0.0.0.108.1064.12j1.13.0....0...1c.1.64.psy-ab..2.13.1061.0..0j0i131i67k1j0i131k1j0i67k1j0i20i263k1j0i3k1j0i203k1.0.UQoX6KY-q2I"
		else
			lien = "https://www.google.com/search?source=hp&ei=sIFQW8WiMISA6QTblLHAAQ&q=twitter+"
			new_ville = ville.split
			new_ville.each do |i|
				lien += ville[i]
				if i != new_ville.length
					lien += "+"
				else
					lien += "&gs_l=psy-ab.3..35i39k1j0i22i30k1l5.905.3801.0.3942.15.14.0.0.0.0.108.1064.12j1.13.0....0...1c.1.64.psy-ab..2.13.1061.0..0j0i131i67k1j0i131k1j0i67k1j0i20i263k1j0i3k1j0i203k1.0.UQoX6KY-q2I"
				end
			end
		end
		# puts "SITE:\n", lien
		# puts "ville == #{ville}"
		
		page = Nokogiri::HTML(open(lien))
		handle = page.css('h3.r')[0].text.split('(')[1].split(')')[0]
		return handle
	end



	def get_all_handle
		tab_handles = []
		@tab_villes.each do |i|
			tab_handles << get_handle(i)
		end
		return tab_handles
	end

end


# tab_villes = ["Chaville","Sevres","saint cloud","ville d'avray"]
# obj1 = Testy.new(tab_villes)
# print obj1.get_all_handle
# puts