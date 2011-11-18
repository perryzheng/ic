class ESV
  require 'net/http'
    #http://www.esvapi.org/v2/rest/passageQuery?key=IP&passage=John3:15-25&include-short-copyright=0&output-format=plain-text&include-passage-horizontal-lines=0&include-heading-horizontal-lines=0&include-footnotes=0&include-passage-references=0&include-headings=0&include-verse-numbers=0
  def initialize(key)
    @options = ["include-short-copyright=0",
                "output-format=plain-text",
                "include-passage-horizontal-lines=0",
                "include-heading-horizontal-lines=0",
                "include-footnotes=0",
                "include-passage-references=0",
                "include-headings=0",
                "include-verse-numbers=0"
                ].join("&")
    @optionsSound = ["output-format=mp3"
                ].join("&")
    @base_url = "http://www.esvapi.org/v2/rest/passageQuery?key=#{key}"
  end

  def doPassageQuery(passage)
      passage = cleansePassage(passage)
      full_url = @base_url +
                  "&passage=#{passage}&#{@options}"
      #puts full_url
      get_url full_url
  end
  
  def doMP3Query(passage)
      passage = cleansePassage(passage)
      full_url = @base_url +
                "&passage=#{passage}&#{@optionsSound}"
      #puts full_url
      get_url full_url
  end

  private
  
  def cleansePassage(passage)
    passage = passage.gsub(/\s/, "+")
    passage = passage.gsub(/\:/, "%3A")
    passage = passage.gsub(/\,/, "%2C")
  end

  def get_url(url)
#    Passage.get(url)
    Net::HTTP.get(::URI.parse(url))
  end
end