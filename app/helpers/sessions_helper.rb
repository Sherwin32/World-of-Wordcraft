module SessionsHelper
	def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    session[:user_id] = "none"
    @current_user = false
   end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

	def user_params
		params.require(:user).permit(:name, :password)
	end

end
