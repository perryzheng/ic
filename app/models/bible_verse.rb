class BibleVerse < ActiveRecord::Base
  attr_accessible :verse_content, :label
  
  belongs_to :bullet_point
  
  validates :label, :presence => true
  validates :bullet_point_id, :presence => true
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

