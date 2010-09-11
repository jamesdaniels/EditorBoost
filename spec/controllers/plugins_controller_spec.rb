require 'spec_helper'

describe PluginsController do

  def mock_plugin(stubs={})
    @mock_plugin ||= mock_model(Plugin, stubs).as_null_object
  end

  def mock_editor
    @mock_editor ||= mock_model(Editor, :name => 'TextMate', :short => 'mate')
  end

  before :each do
    Editor.stub(:find_by_short).with('mate') { mock_editor }
    mock_editor.stub(:plugins) {Plugin}
  end

  describe "GET index" do
    it "assigns all plugins as @plugins" do
      Plugin.stub(:all) { [mock_plugin] }
      get :index, :editor => 'mate'
      assigns(:plugins).should eq([mock_plugin])
    end
  end

  describe "GET show" do
    it "assigns the requested plugin as @plugin" do
      Plugin.stub(:find).with("37") { mock_plugin }
      get :show, :id => "37", :editor => 'mate'
      assigns(:plugin).should be(mock_plugin)
    end
  end

  describe "GET new" do
    it "assigns a new plugin as @plugin" do
      Plugin.stub(:new) { mock_plugin }
      get :new, :editor => 'mate'
      assigns(:plugin).should be(mock_plugin)
    end
  end

  describe "GET edit" do
    it "assigns the requested plugin as @plugin" do
      Plugin.stub(:find).with("37") { mock_plugin }
      get :edit, :id => "37", :editor => 'mate'
      assigns(:plugin).should be(mock_plugin)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created plugin as @plugin" do
        Plugin.stub(:new).with({'these' => 'params'}) { mock_plugin(:save => true) }
        post :create, :plugin => {'these' => 'params'}, :editor => 'mate'
        assigns(:plugin).should be(mock_plugin)
      end

      it "redirects to the created plugin" do
        Plugin.stub(:new) { mock_plugin(:save => true) }
        post :create, :plugin => {}, :editor => 'mate'
        response.should redirect_to(plugin_url(mock_plugin, :editor => 'mate'))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved plugin as @plugin" do
        Plugin.stub(:new).with({'these' => 'params'}) { mock_plugin(:save => false) }
        post :create, :plugin => {'these' => 'params'}, :editor => 'mate'
        assigns(:plugin).should be(mock_plugin)
      end

      it "re-renders the 'new' template" do
        Plugin.stub(:new) { mock_plugin(:save => false) }
        post :create, :plugin => {}, :editor => 'mate'
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested plugin" do
        Plugin.should_receive(:find).with("37") { mock_plugin }
        mock_plugin.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :plugin => {'these' => 'params'}, :editor => 'mate'
      end

      it "assigns the requested plugin as @plugin" do
        Plugin.stub(:find) { mock_plugin(:update_attributes => true) }
        put :update, :id => "1", :editor => 'mate'
        assigns(:plugin).should be(mock_plugin)
      end

      it "redirects to the plugin" do
        Plugin.stub(:find) { mock_plugin(:update_attributes => true) }
        put :update, :id => "1", :editor => 'mate'
        response.should redirect_to(plugin_url(mock_plugin, :editor => 'mate'))
      end
    end

    describe "with invalid params" do
      it "assigns the plugin as @plugin" do
        Plugin.stub(:find) { mock_plugin(:update_attributes => false) }
        put :update, :id => "1", :editor => 'mate'
        assigns(:plugin).should be(mock_plugin)
      end

      it "re-renders the 'edit' template" do
        Plugin.stub(:find) { mock_plugin(:update_attributes => false) }
        put :update, :id => "1", :editor => 'mate'
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested plugin" do
      Plugin.should_receive(:find).with("37") { mock_plugin }
      mock_plugin.should_receive(:destroy)
      delete :destroy, :id => "37", :editor => 'mate'
    end

    it "redirects to the plugins list" do
      Plugin.stub(:find) { mock_plugin }
      delete :destroy, :id => "1", :editor => 'mate'
      response.should redirect_to(plugins_url)
    end
  end

end
