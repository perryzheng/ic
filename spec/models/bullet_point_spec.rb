require 'spec_helper'

describe BulletPoint do
  before(:each) do
    @lesson = Factory(:lesson)
    @attr = { :header => "Old Testament Israel Was Warned to Repent", 
              :bullet_point_content => "" }
  end
  
  it "should create a new instance given valid attributes" do
    @lesson.bullet_points.create!(@attr)
  end
  
  describe "lesson associations" do
    before(:each) do
      @bullet_point = @lesson.bullet_points.create(@attr)
    end
    
    it "should have a lesson attribute" do
      @bullet_point.should respond_to(:lesson)
    end
    
    it "should have the right associated lesson" do
      @bullet_point.lesson_id.should == @lesson.id
      @bullet_point.lesson.should == @lesson
    end
  end

  describe "bible_verse associations" do
    before(:each) do
      @bullet_point = BulletPoint.create(@attr)
    end
    
    it "should have a bible_verses attribute" do
      @bullet_point.should respond_to(:bible_verses)
    end
  end
  
  describe "validations" do
    it "should require a lesson id" do
      BulletPoint.new(@attr).should_not be_valid
    end
    
    it "should require nonblank header" do
      @lesson.bullet_points.build(:header => "   ").should_not be_valid
    end
    
  end
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

