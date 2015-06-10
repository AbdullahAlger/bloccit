class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :flash_attack

  def flash_attack
    flash.now[:notice] = "Flash attack"
  end

end
