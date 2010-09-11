require 'spec_helper'

describe "plugins/index.html.erb" do
  before(:each) do
    @editor = assign(:editor, stub_model(Editor, 
      :name => 'TextMate',
      :short => 'mate'))

    @plugins = assign(:plugins, [
      stub_model(Plugin,
        :name => "Name",
        :editor_id => 1
      ),
      stub_model(Plugin,
        :name => "Name",
        :editor_id => 1
      )
    ])
  end

  it "renders a list of plugins" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end

  it 'should link to all the plugins' do
    render
    @plugins.each do |plugin|
      rendered.should have_selector('a', :href => plugin_path(plugin, :editor => @editor.short), :content => plugin.name)
    end
  end
end
