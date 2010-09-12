require 'spec_helper'

describe "versions/show.html.erb" do
  before(:each) do
    @version = assign(:version, stub_model(Version,
      :number => "Number",
      :changelog => "MyText"
    ))
    @plugin = assign(:plugin, stub_model(Plugin, :id => 1))
    @editor = assign(:editor, stub_model(Editor, :short => 'mate'))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Number".to_s)
    rendered.should contain("MyText".to_s)
  end
end
