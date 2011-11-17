require 'spec_helper'

describe Chapter do
  before(:each) do
    @attr = { :title => "EVERYTHING HAS A FOUNDATION", 
              :content => "" }
  end
  
  it "should create a new instance given valid attributes" do
    Lesson.create!(@attr)
  end
  
  it "should require a title" do
    no_title_lesson = Lesson.new(@attr.merge(:title => ""))
    no_title_lesson.should_not be_valid
  end
    
  describe "lesson associations" do
    before(:each) do
      @chapter = Chapter.create(@attr)
      @lesson1 = Factory(:lesson, :chapter => @chapter)
      @lesson2 = Factory(:lesson, :chapter => @chapter)
    end
    
    it "should have a lessons attribute" do
      @chapter.should respond_to(:lessons)
    end
    
    it "should have the right lessons in the right order" do
      @chapter.lessons.should == [@lesson1, @lesson2]
    end
  end #end of 'bullet point associations'
  
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

