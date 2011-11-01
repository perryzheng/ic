require 'spec_helper'

describe ChaptersController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "GET 'index'" do 
    it "should make the http request successfully" do
      xml = controller.send :getPassage, "John3:16"
      passage = xml['bible']['range']['item']
      passage.should_not be_nil
    end
  end

end
