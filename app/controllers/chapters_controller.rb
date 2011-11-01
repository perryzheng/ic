class ChaptersController < ApplicationController
  def new
  end

  def show
  end
  
  def index
    xml = getPassage("John3:16")
    @passage = xml['bible']['range']['item']
  end
  
  protected
  def getPassage(label)
    Passage.get("http://api.preachingcentral.com/bible.php?passage=#{label}&version=kjv")
  end
end
