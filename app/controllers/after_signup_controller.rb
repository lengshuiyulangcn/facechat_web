class AfterSignupController < ApplicationController
  before_action :authenticate
  include Wicked::Wizard
  steps :nickname

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.nick_name = user_params[:nick_name]
    render_wizard @user
  end

  private
  def finish_wizard_path
    root_path 
  end
  def user_params
    params.require(:user).permit(:nick_name)
  end

end
