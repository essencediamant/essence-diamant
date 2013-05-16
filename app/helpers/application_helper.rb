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
end