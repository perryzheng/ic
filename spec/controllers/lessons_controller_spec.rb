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

  describe "GET 'new'" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have a title field" do
      get 'new'
      response.should have_selector("input[name='lesson[title]'][type='text']")
    end
    
  end
  
  describe "GET 'edit'" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @lesson = Factory(:lesson)
    end
    
    it "should be successful" do
      get :edit, :id => @lesson
      response.should be_success
    end
  end
  
  describe "PUT 'update'" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @lesson = Factory(:lesson)
    end

    describe "failure" do
      before(:each) do
        @attr = { :title => "", :lesson_content => "something" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @lesson, :lesson => @attr
        response.should render_template('edit')
      end
    end  
    
    describe "success" do

      before(:each) do
        @attr = { :title => "non-empty", :lesson_content => "something"}
      end

      it "should change the user's attributes" do
        put :update, :id => @lesson, :lesson => @attr
        @lesson.reload
        @lesson.title.should  == @attr[:title]
        @lesson.lesson_content.should == @attr[:lesson_content]
      end

      it "should redirect to the user show page" do
        put :update, :id => @lesson, :lesson => @attr
        response.should redirect_to(lesson_path(@lesson))
      end

      it "should have a flash message" do
        put :update, :id => @lesson, :lesson => @attr
        flash[:success].should =~ /updated/
      end
    end
  end
  
  describe "POST 'create'" do
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end
    
    describe "failure" do
      before(:each) do
        @attr = { :title => "", :lesson_content => ""}
      end

      it "should not create a lesson" do
        lambda do 
          post :create, :lesson => @attr
        end.should_not change(Lesson, :count)
      end

      it "should render the 'new' page" do
        post :create, :lesson => @attr
        response.should render_template('new')
      end
    end
     
    describe "success" do
       before(:each) do
         @attr = { :title => "Repentance From Dead Works", 
                   :lesson_content => "Turning from a life of sin to serve God.."}
       end

       it "should create a lesson " do
         lambda do
           post :create, :lesson => @attr
         end.should change(Lesson, :count).by(1)
       end

       it "should redirect to the home page" do
         post :create, :lesson => @attr
         response.should redirect_to(lesson_path(assigns(:lesson)))
       end

       it "should have a flash message" do
         post :create, :lesson => @attr
         flash[:success].should =~ /lesson created/i
       end
       
       it "should take the attr as lists" do
         @attr = {"title"=>"Sample Lesson", "lesson_content"=>"God is sovereign", "bullet_points_attributes"=>{"0"=>{"header"=>"Header is cool", "bible_verses_attributes"=>{"0"=>{"label"=>"John 3:17"}}}}}                       
         post :create, :lesson => @attr
         flash[:success].should =~ /lesson created/i
         response.should redirect_to(lesson_path(assigns(:lesson)))
       end
        
     end  #end of 'success'
  end

  describe "access control" do
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end
  end

end
