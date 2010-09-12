require 'spec_helper'

describe "versions/index.html.erb" do
  before(:each) do
    assign(:versions, [
      stub_model(Version,
        :number => "Number",
        :changelog => "MyText"
      ),
      stub_model(Version,
        :number => "Number",
        :changelog => "MyText"
      )
    ])
    assign(:plugin, stub_model(Plugin, :id => 1))
    assign(:editor, stub_model(Editor, :short => 'mate'))
  end

  it "renders a list of versions" do
    render
    rendered.should have_selector("tr>td", :content => "Number".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
