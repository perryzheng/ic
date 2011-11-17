require 'spec_helper'

describe Lesson do
  before(:each) do
    @attr = { :title => "Repentance From Dead Works", 
              :lesson_content => "Turning from a life of sin to serve God.." }
  end
  
  it "should create a new instance given valid attributes" do
    Lesson.create!(@attr)
  end
  
  it "should require a title" do
    no_title_lesson = Lesson.new(@attr.merge(:title => ""))
    no_title_lesson.should_not be_valid
  end
  
  describe "nested forms" do
    it "should be valid" do
      @attr = {"title"=>"Sample Lesson", "lesson_content"=>"God is sovereign", "bullet_points_attributes"=>{"0"=>{"header"=>"Header is cool", "bible_verses_attributes"=>{"0"=>{"label"=>"John 3:17"}}}}}                       
      
      lesson = Lesson.create(@attr)
      lesson.should be_valid
    end
    
  end
  
  describe "bullet point associations" do
    before(:each) do
      @lesson = Lesson.create(@attr)
      @bp1 = Factory(:bullet_point, :lesson => @lesson)
      @bp2 = Factory(:bullet_point, :lesson => @lesson)
    end
    
    it "should have a bullet_point attribute" do
      @lesson.should respond_to(:bullet_points)
    end
    
    it "should have the right bullet points in the right order" do
      @lesson.bullet_points.should == [@bp1, @bp2]
    end
  end #end of 'bullet point associations'

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

