class Chapter < ActiveRecord::Base
  attr_accessible :title, :content, :lessons_attributes
  has_many :lessons
  accepts_nested_attributes_for :lessons, :allow_destroy => true
  validates :title, :presence => true
  
  default_scope :order => 'chapters.id'
end

# == Schema Information
#
# Table name: chapters
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

