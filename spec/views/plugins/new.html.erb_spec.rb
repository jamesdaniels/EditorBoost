require 'spec_helper'

describe "plugins/new.html.erb" do
  before(:each) do
    @editor = assign(:editor, stub_model(Editor, 
      :name => 'TextMate',
      :short => 'mate'))
    assign(:plugin, stub_model(Plugin,
      :new_record? => true,
      :name => "MyString",
      :editor_id => 1
    ))
  end

  it "renders new plugin form" do
    render

    rendered.should have_selector("form", :action => plugins_path(:editor => @editor.short), :method => "post") do |form|
      form.should have_selector("input#plugin_name", :name => "plugin[name]")
    end
  end
end
