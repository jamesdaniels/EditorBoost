require 'spec_helper'

describe "Editor" do
  describe "GET /" do 
    it 'works!' do
      get '/'
    end
  end
  describe "GET /mate" do
    before :each do
      @mock_editor = mock_model(Editor, :name => 'TextMate', :short => 'mate')
      Editor.stub(:find_by_short).with('mate') {@mock_editor}
    end

    it "works! (now write some real specs)" do
      get '/mate'
    end
  end
end
