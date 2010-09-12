require 'spec_helper'

describe "versions/new.html.erb" do
  before(:each) do
    assign(:version, stub_model(Version,
      :new_record? => true,
      :number => "MyString",
      :changelog => "MyText"
    ))
    @plugin = assign(:plugin, stub_model(Plugin, :id => 1))
    @editor = assign(:editor, stub_model(Editor, :short => 'mate'))
  end

  it "renders new version form" do
    render

    rendered.should have_selector("form", :action => plugin_versions_path(@plugin, :editor => @editor.short), :method => "post") do |form|
      form.should have_selector("input#version_number", :name => "version[number]")
      form.should have_selector("textarea#version_changelog", :name => "version[changelog]")
    end
  end
end
