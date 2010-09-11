require "spec_helper"

describe EditorController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/" }.should route_to(:controller => "editor", :action => "index")
    end
    
    it "recognizes and generates #show" do
      { :get => "/mate" }.should route_to(:controller => "editor", :action => "show", :editor => 'mate')
    end

  end
end

