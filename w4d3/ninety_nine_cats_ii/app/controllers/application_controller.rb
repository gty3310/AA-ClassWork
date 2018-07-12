class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user #enable views to use this method

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to cats_url if logged_in?
  end

  def owns_cat?
    # params[:id]
    cat = Cat.find(params[:id])
    user_cats = current_user.cats
    user_cats.include?(cat)
  end

  def require_owns_cat
    redirect_to cat_url(params[:id]) unless owns_cat?
  end





end
