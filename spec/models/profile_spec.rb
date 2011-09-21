require 'spec_helper'

describe Profile do
  before(:each) do
    @user = Factory(:user)
    @attr = { 
      :first_name => "example",
      :last_name => "user",
      :phone => "917-518-5151",
      :esl => true,
      :country => "China", 
      :start_date => "2011-02-19",
      :end_date => "2014-02-19",
      :english_help => true,
      :living_help => false,
      :fun_help => true,
      :notes => "i want friends!"  
    }
  end

  it "should create a new instance given valid attributes" do
    @profile = @user.create_profile(@attr)
  end
  
  describe "user associations" do

    before(:each) do
      @profile = @user.create_profile(@attr)
    end

    it "should have a user attribute" do
      @profile.should respond_to(:user)
    end

    it "should have the right associated user" do
      @profile.user_id.should == @user.id
      @profile.user.should == @user
    end
  end
  
  describe "validations" do
    it "should require a user id" do
      Profile.new(@attr).should_not be_valid
    end
    
    it "should require nonblank first_name" do
      @user.build_profile(:first_name => "").should_not be_valid
    end
    
    it "should reject long notes" do
      @user.build_profile(:notes => "a" * 256).should_not be_valid
    end
    
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

