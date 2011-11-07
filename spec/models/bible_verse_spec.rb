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
    # it "should require a bulet_point id" do
    #       BibleVerse.new(@attr).should_not be_valid
    # end
    
    it "should require nonblank verse" do
      bible_verse = @bullet_point.bible_verses.build(@attr.merge(:label => "  "))
      bible_verse.should_not be_valid
    end
  end
  
  describe "getting verse_content from label" do
    it "should be able to get verse_content from label" do
      bible_verse = @bullet_point.bible_verses.create(@attr.merge(:verse_content => ""))
      bible_verse.label.should =~ /John 3:16/i
      bible_verse.verse_content.should =~ /For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life./i
    end
    
    it "should get for phillipians" do
      bible_verse = @bullet_point.bible_verses.create(@attr.merge(:label => "1 Corinthians 1:2"))
      bible_verse.label.should =~ /1 Corinthians 1:2/i
      bible_verse.verse_content.should =~ /Unto the church of God which is at Corinth, to them that are sanctified in Christ Jesus, called to be saints, with all that in every place call upon the name of Jesus Christ our Lord, both theirs and ours:/i
    end
    
    it "should convert psalm to psalms" do
      bible_verse = @bullet_point.bible_verses.create(@attr.merge(:label => "Psalm 87:1"))
      bible_verse.label.should =~ /Psalm 87:1/i
      bible_verse.verse_content.should =~ /His foundation is in the holy mountains/i
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

