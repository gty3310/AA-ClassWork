class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def login_user(user)
    @current_user = user
    session[:session_token] = @current_user.reset_token!
  end

  def logout
    current_user.reset_token!
    session[:session_token] = nil
  end

  # def require_logged_in
  #
  # end
end
