class ProfilesController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to edit_profile_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:pro_expenses)
  end
end
