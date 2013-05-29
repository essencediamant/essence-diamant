module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Essence Diamant"
		if page_title.empty?
			base_title
	  else 
	  	"#{base_title} | #{page_title}"
	  end
	end

	# Returns appropriate footer for english or french pages
	def footer(footer)
		french_footer = 'layouts/frenchfooter'
		if footer.empty?
			french_footer
		else 
			footer
		end
	end

	# Returns appropriate quote for english or french pages
	def quote(quote)
		french_quote = '« Les façons vagues, métaphoriques ou poétiques de décrire le processus de renaissance spirituelle ajoutent souvent plus de confusion que de clarté. Elles peuvent avoir un attrait esthétique et nous inspirer, mais pour la personne assoiffée, voire agonisante, une façon raffinée de décrire le chemin qui mène au puits ne vaut pas tant qu’une description précise, claire et succincte. De plus, la précision elle-même radie une esthétique particulière, une beauté claire et lumineuse semblable à la beauté d’un précieux diamant. »'
		if quote.empty?
			french_quote
		else
			quote
		end
	end
end