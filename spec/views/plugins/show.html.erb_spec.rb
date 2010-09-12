require 'spec_helper'

describe "plugins/show.html.erb" do
  before(:each) do
    @editor = assign(:editor, stub_model(Editor, 
      :name => 'TextMate',
      :short => 'mate'))
    @plugin = assign(:plugin, stub_model(Plugin,
      :name => "Name",
      :description => 'Asdf2',
      :readme => 'README2',
      :editor_id => 1))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(@plugin.name)
    rendered.should contain(@plugin.description)
    rendered.should contain(@plugin.readme)
  end
end
