class Lesson < ActiveRecord::Base
  attr_accessible :title, :lesson_content, :bullet_points_attributes
  has_many :bullet_points
  belongs_to :chapter
  accepts_nested_attributes_for :bullet_points, :allow_destroy => true
  validates :title, :presence => true
end


# == Schema Information
#
# Table name: lessons
#
#  id             :integer         not null, primary key
#  title          :string(255)
#  lesson_content :text
#  created_at     :datetime
#  updated_at     :datetime
#  chapter_id     :integer
#

