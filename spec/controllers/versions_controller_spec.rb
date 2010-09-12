require 'spec_helper'

describe VersionsController do

  def mock_version(stubs={})
    @mock_version ||= mock_model(Version, stubs).as_null_object
  end

  def mock_plugin(stubs={})
    @mock_plugin ||= mock_model(Plugin, stubs).as_null_object
  end

  def mock_editor
    @mock_editor ||= mock_model(Editor, :name => 'TextMate', :short => 'mate').as_null_object
  end

  before :each do
    Editor.stub(:find_by_short).with('mate') { mock_editor }
    mock_editor.stub!(:plugins) { Plugin } 
    Plugin.stub(:find) { mock_plugin }
    mock_plugin.stub!(:versions) { Version }
  end

  describe "GET index" do
    it "assigns all versions as @versions" do
      Version.stub(:all) { [mock_version] }
      get :index, :editor => 'mate', :plugin_id => 1
      assigns(:versions).should eq([mock_version])
    end
  end

  describe "GET show" do
    it "assigns the requested version as @version" do
      Version.stub(:find).with("37") { mock_version }
      get :show, :id => "37", :editor => 'mate', :plugin_id => 1
      assigns(:version).should be(mock_version)
    end
  end

  describe "GET new" do
    it "assigns a new version as @version" do
      Version.stub(:new) { mock_version }
      get :new, :editor => 'mate', :plugin_id => 1
      assigns(:version).should be(mock_version)
    end
  end

  describe "GET edit" do
    it "assigns the requested version as @version" do
      Version.stub(:find).with("37") { mock_version }
      get :edit, :id => "37", :editor => 'mate', :plugin_id => 1
      assigns(:version).should be(mock_version)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created version as @version" do
        Version.stub(:new).with({'these' => 'params'}) { mock_version(:save => true) }
        post :create, :version => {'these' => 'params'}, :editor => 'mate', :plugin_id => 1
        assigns(:version).should be(mock_version)
      end

      it "redirects to the created version" do
        Version.stub(:new) { mock_version(:save => true) }
        post :create, :version => {}, :editor => 'mate', :plugin_id => 1
        response.should redirect_to(plugin_version_url(mock_plugin, mock_version, :editor => mock_editor.short))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved version as @version" do
        Version.stub(:new).with({'these' => 'params'}) { mock_version(:save => false) }
        post :create, :version => {'these' => 'params'}, :editor => 'mate', :plugin_id => 1
        assigns(:version).should be(mock_version)
      end

      it "re-renders the 'new' template" do
        Version.stub(:new) { mock_version(:save => false) }
        post :create, :version => {}, :editor => 'mate', :plugin_id => 1
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested version" do
        Version.should_receive(:find).with("37") { mock_version }
        mock_version.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :version => {'these' => 'params'}, :editor => mock_editor.short, :plugin_id => 1
      end

      it "assigns the requested version as @version" do
        Version.stub(:find) { mock_version(:update_attributes => true) }
        put :update, :id => "1", :editor => 'mate', :plugin_id => 1
        assigns(:version).should be(mock_version)
      end

      it "redirects to the version" do
        Version.stub(:find) { mock_version(:update_attributes => true) }
        put :update, :id => "1", :editor => 'mate', :plugin_id => 1
        response.should redirect_to(plugin_version_url(mock_plugin, mock_version, :editor => mock_editor.short))
      end
    end

    describe "with invalid params" do
      it "assigns the version as @version" do
        Version.stub(:find) { mock_version(:update_attributes => false) }
        put :update, :id => "1", :editor => 'mate', :plugin_id => 1
        assigns(:version).should be(mock_version)
      end

      it "re-renders the 'edit' template" do
        Version.stub(:find) { mock_version(:update_attributes => false) }
        put :update, :id => "1", :editor => 'mate', :plugin_id => 1
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested version" do
      Version.should_receive(:find).with("37") { mock_version }
      mock_version.should_receive(:destroy)
      delete :destroy, :id => "37", :editor => 'mate', :plugin_id => 1
    end

    it "redirects to the versions list" do
      Version.stub(:find) { mock_version }
      delete :destroy, :id => "1", :editor => 'mate', :plugin_id => 1
      response.should redirect_to(plugin_versions_url(mock_plugin, :editor => mock_editor.short))
    end
  end

end
