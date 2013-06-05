class StuGist
  attr_accessor :URL, :content, :git_handle, :cstring, :word_list, :word_count, :wraw_count

  @@tgr = EngTagger.new

  def initialize(chunk)
    @URL = GistScraper::BASE_URL + chunk
    @git_handle = chunk.split("/").fetch(1)
    @content = GistScraper::getContent(chunk)
    @cstring = @content.to_a.join(' ')
    @wraw_count = @cstring.split(' ').length
    @word_list = get_wordlist(@cstring)
    @word_count = @word_list.length
  end

  def get_wordlist(content)
    list = @@tgr.get_words(content)
    list.sort_by {|word, count| count}
  end

  private



end