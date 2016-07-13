class WelcomeController < ApplicationController
  before_action :finish_profile, only: [:home]
  def home
  end
  private
  def finish_profile
    redirect_to after_signup_path(:nickname) if current_user && current_user.nick_name.blank?
  end
end
