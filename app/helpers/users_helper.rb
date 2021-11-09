module UsersHelper
  def authenticate_user_valid_for_users_actions()
    unless current_user == params[:id]
      flash[:danger] = "Action non autorisée"
      redirect_to users_path
    end
  end
  def authenticate_user_valid_for_events_actions()
    unless current_user == event.administrator.id
      flash[:danger] = "Action non autorisée"
      redirect_to users_path
    end
  end
end
