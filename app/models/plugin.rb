class Plugin < ActiveRecord::Base

  belongs_to :editor, :inverse_of => :plugins

  validates :name, :editor_id, :presence => true
  validates :name, :uniqueness => {:scope => :editor_id}

end
