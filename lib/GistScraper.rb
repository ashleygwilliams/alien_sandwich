require 'open-uri'

class GistScraper

	BASE_URL = "https://gist.github.com"

	def getDataHash(gist_url)
		download = open(BASE_URL + gist_url)
		html = Nokogiri::HTML(download)
		if html.search(".line").length > 0
			gist = html.search(".line")
		else
			gist = html.search("article")
		end
	end

end