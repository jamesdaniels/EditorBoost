require "spec_helper"

describe PluginsController do
  describe "routing" do

    it "recognizes and generates #index" do
      SecureRandom.hex(4).tap do |editor|
        { :get => "/#{editor}/plugins" }.should route_to(:controller => "plugins", :action => "index", :editor => editor)
      end
    end

    it "recognizes and generates #new" do
      { :get => "/vim/plugins/new" }.should route_to(:controller => "plugins", :action => "new", :editor => 'vim')
    end

    it "recognizes and generates #show" do
      { :get => "/mate/plugins/1" }.should route_to(:controller => "plugins", :action => "show", :id => "1", :editor => 'mate')
    end

    it "recognizes and generates #edit" do
      { :get => "/emacs/plugins/1/edit" }.should route_to(:controller => "plugins", :action => "edit", :id => "1", :editor => 'emacs')
    end

    it "recognizes and generates #create" do
      { :post => "/vim/plugins" }.should route_to(:controller => "plugins", :action => "create", :editor => 'vim')
    end

    it "recognizes and generates #update" do
      { :put => "/mate/plugins/1" }.should route_to(:controller => "plugins", :action => "update", :id => "1", :editor => 'mate')
    end

    it "recognizes and generates #destroy" do
      { :delete => "/emacs/plugins/1" }.should route_to(:controller => "plugins", :action => "destroy", :id => "1", :editor => 'emacs')
    end

  end
end
