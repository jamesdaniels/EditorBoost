require 'spec_helper'

describe "versions/edit.html.erb" do
  before(:each) do
    @version = assign(:version, stub_model(Version,
      :new_record? => false,
      :number => "MyString",
      :changelog => "MyText"
    ))
    @plugin = assign(:plugin, stub_model(Plugin, :id => 1))
    @editor = assign(:editor, stub_model(Editor, :short => 'mate'))
  end

  it "renders the edit version form" do
    render

    rendered.should have_selector("form", :action => plugin_version_path(@plugin, @version, :editor => @editor.short), :method => "post") do |form|
      form.should have_selector("input#version_number", :name => "version[number]")
      form.should have_selector("textarea#version_changelog", :name => "version[changelog]")
    end
  end
end
