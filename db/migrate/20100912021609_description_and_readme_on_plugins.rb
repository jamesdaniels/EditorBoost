class DescriptionAndReadmeOnPlugins < ActiveRecord::Migration
  def self.up
    add_column :plugins, :description, :string
    add_column :plugins, :readme, :text
  end

  def self.down
    remove_column :plugins, :description
    remove_column :plugins, :readme
  end
end
