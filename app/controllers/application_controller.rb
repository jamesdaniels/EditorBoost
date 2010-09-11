class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :find_editor

private

  def find_editor
    @editor = Editor.find_by_short(params[:editor])
  end

end
