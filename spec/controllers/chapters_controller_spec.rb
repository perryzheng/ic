require 'spec_helper'

describe ChaptersController do
  render_views

  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @chapter = Factory(:chapter)
    end
    
    it "should be successful" do
      get :show, :id => @chapter
      puts response
      response.should be_success
    end
  end
  
  describe "GET 'edit'" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @chapter = Factory(:chapter)
    end
    
    it "should be successful" do
      get :edit, :id => @chapter
      response.should be_success
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end
    
    describe "failure" do
      before(:each) do
        @attr = { :title => "", :content => "some chapter introduction" }
      end
      
      it "should not create a chapter" do
        lambda do
          post :create, :chapter => @attr
        end.should_not change(Chapter, :count)
      end
      
      it "should render the 'new' page" do
        post :create, :chapter => @attr
        response.should render_template('new')
      end
    end #end of failure
    
    describe "success" do
      before(:each) do
        @attr = { :title => "some title", 
                  :content => "some content" }
      end
      
      it "should create a chapter" do
        lambda do
          post :create, :chapter => @attr
        end.should change(Chapter, :count).by(1)
      end
      
      it "should redirect to the homepage" do
        post :create, :chapter => @attr
        response.should redirect_to(chapter_path(assigns(:chapter)))
      end
      
      it "should have a flash message" do
        post :create, :chapter => @attr
        flash[:success].should =~ /chapter created/i
      end
      
      it "should take lessons as lists" do
        @attr = {"title"=>"some title", "content"=>"some content", "lessons_attributes"=>{"0"=>{"_destroy"=>"false", "title"=>"some lesson title"}}}
        post :create, :chapter => @attr
        flash[:success].should =~ /chapter created/i
      end
      
    end
  end
  
  describe "PUT 'update'" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @chapter = Factory(:chapter)
    end
    
    describe "failure" do
      before(:each) do
        @attr = { :title => "", :content => "non-empty content" }
      end
      
      it "should render the 'edit' page" do
        put :update, :id => @chapter, :chapter => @attr
        response.should render_template('edit')
      end
    end #end of 'failure'
    
    describe "success" do
      before(:each) do
        @attr = { :title => "this is a non-empty title", :content => "non-empty content" }
      end
      
      it "should change the chapter's attributes" do
        put :update, :id => @chapter, :chapter => @attr
        @chapter.reload
        @chapter.title.should == @attr[:title]
        @chapter.content.should == @attr[:content]
      end
      
      it "should redirect to the chapter page" do
        put :update, :id => @chapter, :chapter => @attr
        response.should redirect_to(chapter_path(assigns(:chapter)))        
      end
    end
  end
  
  describe "access control" do
    it "should deny access to a lot of stuff" do
      @chapter = Factory(:chapter)
      get :show, :id => @chapter
      response.should redirect_to(signin_path)
    end
  end
end
