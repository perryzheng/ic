class BibleVerse < ActiveRecord::Base
  attr_accessible :verse_content, :label, :mp3_url
  belongs_to :bullet_point
  validates :label, :presence => true
  #validates :bullet_point_id, :presence => true #makes the nested form create fail
  before_create :get_verse_content_via_web_service_esv
  before_save :get_verse_content_via_web_service_esv
  
  def get_verse_content_via_web_service_kjv
    self.verse_content = get_passage_kjv(self.label)
  end
  
  def get_verse_content_via_web_service_esv
    self.verse_content = get_passage_esv(self.label)
    self.mp3_url = get_mp3_url_esv(self.label)
  end

  def get_passage_esv(passage)
    @bible = ESV.new('IP')
    @bible.doPassageQuery(passage).strip
  end
  
  def get_mp3_url_esv(passage)
    @bible.doMP3Query(passage).strip
  end
  
  def get_passage_kjv(label)
    cleansed_label = cleanse(label)
    xml = Passage.get("http://api.preachingcentral.com/bible.php?passage=#{cleansed_label}&version=kjv")
    if xml['bible']['error'] != nil
      return "There is an error getting this verse"
    end
    items = xml['bible']['range']['item']
    if items.instance_of? Hash
      return items['text']
    end
    res = ""
    items.each do |item|
      puts item['text']
      res += item['text'] + " "
    end
    return res.strip()
  rescue
    return "Not able to get this verse: #{$!}" 
  end
  
  def remove_all_spaces(str)
    str.gsub(/\s+/, "")
  end
  
  def cleanse(str)
    @mapped_labels = {"psalm" => "psalms"}
    str_without_spaces = remove_all_spaces(str).downcase
    @mapped_labels.each do |label, better_label|
      if str_without_spaces.include?(label)
        return str_without_spaces.gsub(label, better_label)
      end
    end
    return str_without_spaces
  end

  
end


# == Schema Information
#
# Table name: bible_verses
#
#  id              :integer         not null, primary key
#  verse_content   :text
#  label           :string(255)
#  bullet_point_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#  mp3_url         :string(255)
#

