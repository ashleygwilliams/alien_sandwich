class GistScraper

	BASE_URL = "https://gist.github.com/"

	def initialize(gistArray)
		@gists = gistArray
	end

	def getDataHash
		dataHash = {}
		@gists.each do |gist|
			download = open(BASE_URL + gist)
			#html = Nokogiri::HTML(download)
			#gist = html.seach(".line")
			gist.split("/")
			gist
		end
	end

end