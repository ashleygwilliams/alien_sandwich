class Analyzer
  attr_accessor :word_pwraw

  def initialize(gistArray)
    @gists = gistArray
    @word_count = get_avg_wordcount
    @wraw_count = get_avg_wrawcount
    @word_pwraw = @wraw_count/@word_count
  end

  def get_avg_wordcount
    word_count = 0
    @gists.each do |gist|
      word_count += gist.word_count
    end
    word_count/@gists.length
  end

  def get_avg_wrawcount
    wraw_count = 0
    @gists.each do |gist|
      wraw_count += gist.wraw_count
    end
    wraw_count/@gists.length
  end

  def get_top_wordlist
    top_wordlist = {}
    @gists.each do |gist|
      topword = gist.word_list.last[0].downcase.gsub(/[^a-z\s]/, '')
      if top_wordlist.include? topword
        top_wordlist[topword] += 1
      else
        top_wordlist[topword] = 1
      end
    end
    top_wordlist.sort_by {|word, count| count}
  end

  def get_pop_wordlist
    pop_wordlist = {}
    @gists.each do |gist|
      popwords = gist.word_list.select {|word, count| count >= 3 }
      popwords.each do |popword, count|
        if pop_wordlist.include? popword.downcase.gsub(/[^a-z\s]/, '')
          pop_wordlist[popword.downcase.gsub(/[^a-z\s]/, '')] += 1
        else
          pop_wordlist[popword.downcase.gsub(/[^a-z\s]/, '')] = 1
        end
      end
    end
    pop_wordlist.sort_by {|word, count| count}
  end

end