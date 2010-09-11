class EditorController < ApplicationController

  def show
  end

  def index
    @editors = Editor.all
  end

end
