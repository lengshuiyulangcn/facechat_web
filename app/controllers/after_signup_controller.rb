class AfterSignupController < ApplicationController
  before_filter :authenticate_user!
  include Wicked::Wizard
  steps :info

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.nick_name = user_params[:nick_name]
    @user.email = user_params[:email]
    render_wizard @user
  end

  private
  def finish_wizard_path
    root_path 
  end
  def user_params
    params.require(:user).permit(:nick_name, :email)
  end

end
