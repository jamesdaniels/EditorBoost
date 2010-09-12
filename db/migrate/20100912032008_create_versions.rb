class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.string :number
      t.text :changelog
      t.integer :plugin_id
      t.timestamps
    end
  end

  def self.down
    drop_table :versions
  end
end
