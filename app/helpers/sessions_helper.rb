module SessionsHelper
  def current_user
    # if @current_user
    #   return @current_user
    # else
    #   @current_user = User.find_by(id: session[:user_id])
    #   return @current_user
    # end

    # @current_user = @current_user || User.find_by(id: session[:user_id])
    # @current_user ||= User.find_by(id: session[:user_id])
    # i = 0
    # i = i + 1
    # i += 1

    # if true || false
    # end
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    current_user.present?
  end
end