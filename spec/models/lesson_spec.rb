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

