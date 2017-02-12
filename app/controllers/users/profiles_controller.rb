class Users::ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_user

  def edit
    @profile = @user.user_profile
  end

  def update
    @profile = @user.user_profile
    if @profile.update_attributes(profile_params)
      flash[:notice] = "You've successfully updated your profile!"
      redirect_to current_user
    else
      render 'edit'
      flash[:alert] = "You have failed to update your profile."
    end
  end

  private

    def set_user
      @user = current_user
    end

    def correct_user
      @user = User.friendly.find(params[:user_id])
      if current_user != @user
        redirect_to user_path(@user)
        flash[:alert] = "This is not your profile."
      end
    end

    def profile_params
      params.require(:user_profile).permit(:first_name, :last_name, :age, :location, :gender, :biography, :theme_color)
    end

end