require 'spec_helper'

describe BibleVerse do
  before(:each) do
    @bullet_point = Factory(:bullet_point)
    @attr = { :verse_content => "For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.", 
              :label => "John 3:16" }
  end
  
  it "should create a new instance given the valid attributes" do
    @bullet_point.bible_verses.create!(@attr)
  end
  
  describe "bullet point associations" do
    before(:each) do
      @bible_verse = @bullet_point.bible_verses.create(@attr)
    end
    
    it "should have a bullet_point attribute" do
      @bible_verse.should respond_to(:bullet_point)
    end
    
    it "should have the right bullet point" do
      @bible_verse.bullet_point_id.should == @bullet_point.id
      @bible_verse.bullet_point.should == @bullet_point
    end
  end

  describe "validations" do
    it "should require a bulet_point id" do
      BibleVerse.new(@attr).should_not be_valid
    end
    
    it "should require nonblank verse" do
      @bullet_point.bible_verses.build(@attr.merge(:label => "  ")).should_not be_valid
    end
  end
  
end

# == Schema Information
#
# Table name: bible_verses
#
#  id              :integer         not null, primary key
#  verse_content   :text
#  label           :string(255)
#  bullet_point_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

