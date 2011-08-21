require 'spec_helper'

describe "information page routing" do
  it "should routes home page to page#home" do
    {:get => "/"}.should route_to :controller=>"pages", :action=>"home"
  end
end