class Lesson < ActiveRecord::Base
  attr_accessible :title, :lesson_content
  
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
#

