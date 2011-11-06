require 'spec_helper'

describe LessonsController do
  render_views

  describe "GET 'show'" do
    before(:each) do
      @lesson = Factory(:lesson)
    end
    
    it "should be successful" do
      get :show, :id => @lesson
      response.should be_success
    end
    
    it "should show the lesson's title and lesson_content" do
      get :show, :id => @lesson
      response.should have_selector("h1", :content => @lesson.title)
      response.should have_selector("p", :content => @lesson.lesson_content)
    end
    
    it "should show all the bullet_points" do
      bp1 = Factory(:bullet_point, :lesson => @lesson, :header => "Header 1")
      bp2 = Factory(:bullet_point, :lesson => @lesson, :header => "Header 2")
      get :show, :id => @lesson
      response.should have_selector("li", :content => bp1.header)
      response.should have_selector("li", :content => bp2.header)
    end
    
    it "should show the bullet_points' bible_verses" do
      bp1 = Factory(:bullet_point, :lesson => @lesson, :header => "Header 1")
      bp2 = Factory(:bullet_point, :lesson => @lesson, :header => "Header 2")
      bv1 = Factory(:bible_verse, :bullet_point => bp1)
      bv2 = Factory(:bible_verse, :bullet_point => bp2, :label => "John 3:34", :verse_content => "For the one whom God has sent speaks the words of God.." )
      get :show, :id => @lesson
      response.should have_selector("span", :content => bv1.verse_content)
      response.should have_selector("span", :content => bv2.verse_content)
    end
    
  end

end
