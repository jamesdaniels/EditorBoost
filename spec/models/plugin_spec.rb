require 'spec_helper'

describe Plugin do
  pending "add some examples to (or delete) #{__FILE__}"

  before :each do
    @valid_attributes = {:name => 'asdf', :editor_id => 1, :description => 'One-liner', :readme => 'More the one-liner'}
  end

  it 'should be valid with valid attributes' do
    Plugin.new(@valid_attributes).valid?.should be_true
  end

  describe 'should require required attribute' do
    [:name, :editor_id].each do |attribute|
      it "#{attribute}" do
        Plugin.new(@valid_attributes.merge(attribute => nil)).valid?.should be_false
      end
    end
  end

  it 'should require name to be unique' do
    Plugin.create!(@valid_attributes)
    plugin = Plugin.new(@valid_attributes)
    plugin.valid?.should be_false
    plugin.errors.on(:name).should eql('has already been taken')
  end

  it 'should allow duplicate names on another editor' do
    Plugin.create!(@valid_attributes.merge(:editor_id => 10))
    plugin = Plugin.new(@valid_attributes.merge(:editor_id => 11))
    plugin.valid?.should be_true
  end

end
