require 'spec_helper'

describe "plugins/edit.html.erb" do
  before(:each) do
    @editor = assign(:editor, stub_model(Editor, 
      :name => 'TextMate',
      :short => 'mate'))
    @plugin = assign(:plugin, stub_model(Plugin,
      :new_record? => false,
      :name => "MyString",
      :editor_id => 1
    ))
  end

  it "renders the edit plugin form" do
    render

    rendered.should have_selector("form", :action => plugin_path(@plugin, :editor => @editor.short), :method => "post") do |form|
      form.should have_selector("input#plugin_name", :name => "plugin[name]")
    end
  end
end
