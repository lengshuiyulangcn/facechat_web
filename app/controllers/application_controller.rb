class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :finish_profile

  private
  def finish_profile
    if current_user && controller_name != 'after_signup'
      redirect_to after_signup_path(:info) if current_user.need_more_info?
    end
  end
end
