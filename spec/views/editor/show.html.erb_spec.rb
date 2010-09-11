require 'spec_helper'

describe "editor/show.html.erb" do
  before(:each) do
    @editor = assign(:editor,
      stub_model(Editor,
        :name => "TextMate",
        :short => 'mate'
      ))
  end

  it "renders a details on the editor" do
    render
    rendered.should contain('TextMate')
    rendered.should have_selector("a", :href => plugins_path(:editor => @editor.short), :content => 'Show all plugins')
  end
end


