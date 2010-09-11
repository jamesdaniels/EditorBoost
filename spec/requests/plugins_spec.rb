require 'spec_helper'

describe "Plugins" do
  describe "GET /mate/plugins" do
    before :each do
      @mock_editor = mock_model(Editor, :name => 'TextMate', :short => 'mate')
      Editor.stub(:find_by_short).with('mate') {@mock_editor}
      @mock_editor.stub!(:plugins) {Plugin}
    end

    it "works! (now write some real specs)" do
      get plugins_path(:editor => 'mate')
    end
  end
end
