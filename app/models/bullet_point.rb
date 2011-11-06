class BulletPoint < ActiveRecord::Base
  attr_accessible :header, :bullet_point_content
  
  belongs_to :lesson
  has_many :bible_verses
  
  validates :header, :presence => true
  validates :lesson_id, :presence => true
end

# == Schema Information
#
# Table name: bullet_points
#
#  id                   :integer         not null, primary key
#  header               :string(255)
#  bullet_point_content :text
#  lesson_id            :integer
#  created_at           :datetime
#  updated_at           :datetime
#

