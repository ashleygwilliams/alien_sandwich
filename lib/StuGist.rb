class StuGist
  attr_accessor :URL, :content, :git_handle, :cstring, :word_list

  @@tgr = EngTagger.new

  def initialize(chunk)
    @URL = GistScraper::BASE_URL + chunk
    @git_handle = chunk.split("/").fetch(1)
    @content = GistScraper::getContent(chunk)
    @cstring = @content.to_a.join(' ')
    @word_list = get_wordlist(@cstring)
  end

  def get_wordlist(content)
    list = @@tgr.get_words(content)
    list.sort_by {|word, count| count}
  end

  private



end