module SessionsHelper
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def log_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logged_in?
    !!current_user
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end


end
