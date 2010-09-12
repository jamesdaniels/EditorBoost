require "spec_helper"

describe VersionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/mate/plugins/1/versions" }.should route_to(:controller => "versions", :plugin_id => '1', :editor => 'mate', :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/mate/plugins/1/versions/new" }.should route_to(:controller => "versions", :plugin_id => '1', :editor => 'mate', :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/mate/plugins/1/versions/1" }.should route_to(:controller => "versions", :plugin_id => '1', :editor => 'mate', :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/mate/plugins/1/versions/1/edit" }.should route_to(:controller => "versions", :plugin_id => '1', :editor => 'mate', :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/mate/plugins/1/versions" }.should route_to(:controller => "versions", :plugin_id => '1', :editor => 'mate', :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/mate/plugins/1/versions/1" }.should route_to(:controller => "versions", :plugin_id => '1', :editor => 'mate', :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/mate/plugins/1/versions/1" }.should route_to(:controller => "versions", :plugin_id => '1', :editor => 'mate', :action => "destroy", :id => "1")
    end

  end
end
