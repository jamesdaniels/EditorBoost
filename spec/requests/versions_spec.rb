require 'spec_helper'

describe "Versions" do
  describe "GET /mate/plugins/1/versions" do
    before :each do
      @mock_editor = mock_model(Editor, :name => 'TextMate', :short => 'mate')
      Editor.stub(:find_by_short).with('mate') {@mock_editor}
      @mock_plugin = mock_model(Plugin, :id => 1)
      @mock_editor.stub!(:plugins) {Plugin}
      Plugin.stub!(:find) { @mock_plugin }
      @mock_plugin.stub(:versions) {Version}
      Version.stub(:all) {[
        mock_model(Version, :id => 1, :number => '1', :changelog => 'asdf1'),
        mock_model(Version, :id => 2, :number => '1', :changelog => 'asdf1'),
        mock_model(Version, :id => 3, :number => '1', :changelog => 'asdf1')
      ]}
    end
    it "works! (now write some real specs)" do
      get plugin_versions_path(@mock_plugin, :editor => @mock_editor.short)
    end
  end
end
