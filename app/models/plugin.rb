class Plugin < ActiveRecord::Base

  belongs_to :editor, :inverse_of => :plugins

end
