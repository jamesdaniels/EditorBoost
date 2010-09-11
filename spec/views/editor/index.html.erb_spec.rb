require 'spec_helper'

describe "editor/index.html.erb" do
  before(:each) do
    @editors = assign(:editors, [
      stub_model(Editor,
        :name => "TextMate",
        :short => 'mate'
      ),
      stub_model(Editor,
        :name => "Vim",
        :short => 'vim'
      )
    ])
  end

  it "renders a list of editors" do
    render
    @editors.each do |editor|
      rendered.should have_selector("a", :href => "/#{editor.short}", :content => editor.name)
    end
  end
end

