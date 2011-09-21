class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :phone, :esl, :country,
                  :start_date, :end_date, :english_help, :living_help,
                  :fun_help, :notes
  belongs_to :user
  
  validates :first_name,  :presence => true
  validates :user_id,     :presence => true
end


# == Schema Information
#
# Table name: profiles
#
#  id           :integer         not null, primary key
#  first_name   :string(255)
#  last_name    :string(255)
#  phone        :string(255)
#  esl          :boolean
#  country      :string(255)
#  start_date   :string(255)
#  end_date     :string(255)
#  english_help :boolean
#  living_help  :boolean
#  fun_help     :boolean
#  notes        :text
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

