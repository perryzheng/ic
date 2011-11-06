class BulletPoint < ActiveRecord::Base
  attr_accessible :header, :bullet_point_content
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

