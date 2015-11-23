class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
    user_timers_path(:user_id)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
