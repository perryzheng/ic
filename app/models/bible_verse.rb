class BibleVerse < ActiveRecord::Base
  attr_accessible :verse_content, :label
  
  belongs_to :bullet_point
  
  validates :label, :presence => true
  validates :bullet_point_id, :presence => true
  
  before_create :get_verse_content_via_web_service
  
  def get_verse_content_via_web_service
    self.verse_content = get_passage(self.label)
  end
  
  def get_passage(label)
    label_without_spaces = remove_all_spaces(label)
    xml = Passage.get("http://api.preachingcentral.com/bible.php?passage=#{label_without_spaces}&version=kjv")
    if xml['bible']['error'] != nil
      return "There is an error getting this verse"
    end
    return xml['bible']['range']['item']['text']
  rescue
    return "Not able to get this verse: #{$!}"
  end
  
  def remove_all_spaces(str)
    str.gsub(/\s+/, "")
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

