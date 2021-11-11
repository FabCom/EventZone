class AvatarsController < ApplicationController
  def destroy
    @user = User.find(params[:user_id])
    @user.avatar.purge
    redirect_to(edit_user_registration_path(@user))
  end
end
