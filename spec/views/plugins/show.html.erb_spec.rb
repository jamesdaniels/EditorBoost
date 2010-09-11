require 'spec_helper'

describe "plugins/show.html.erb" do
  before(:each) do
    @editor = assign(:editor, stub_model(Editor, 
      :name => 'TextMate',
      :short => 'mate'))
    @plugin = assign(:plugin, stub_model(Plugin,
      :name => "Name",
      :editor_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
  end
end
