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

	# Returns copyright based on page language.
	def localized_copyright(copyright)
		french_copyright = '© 2013 APPROCHE DIAMANT (DIAMOND APPROACH), RIDHWAN et le symbole "Hu" sont des marques déposées de la Fondation Ridhwan.'
		if copyright.empty?
			french_copyright
		else
			copyright
		end
	end
end
