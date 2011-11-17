class BibleVerse < ActiveRecord::Base
  attr_accessible :verse_content, :label
  belongs_to :bullet_point
  validates :label, :presence => true
  #validates :bullet_point_id, :presence => true #makes the nested form create fail
  before_create :get_verse_content_via_web_service
  before_save :get_verse_content_via_web_service
  
  def get_verse_content_via_web_service
    self.verse_content = get_passage(self.label)
  end
  
  def get_passage(label)
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
#

