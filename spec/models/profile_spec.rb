require 'spec_helper'

describe Profile do
  before(:each) do
    @user = Factory(:user)
    @attr = {

    }
  end
  
  it "should create a new instance given valid attributes" do
    @profile = @user.create_profile!(@attr)
  end
  
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
#  start_date   :date
#  end_date     :date
#  english_help :boolean
#  living_help  :boolean
#  fun_help     :boolean
#  notes        :text
#  created_at   :datetime
#  updated_at   :datetime
#

