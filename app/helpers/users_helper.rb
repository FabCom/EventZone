module UsersHelper
  def authenticate_user_valid_for_users_actions()
    puts "#" * 50
    puts current_user.id
    puts "#" * 50
    puts  params[:id].to_i
    puts "#" * 50
    unless current_user.id == params[:id].to_i
      flash[:danger] = "Action non autorisée"
      redirect_to users_path
    end
  end
  def authenticate_user_valid_for_events_actions()
    unless current_user.id == @event.administrator_id
      flash[:danger] = "Action non autorisée"
      redirect_to users_path
    end
  end
end
