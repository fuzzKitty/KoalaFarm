class ApplicationController < ActionController::Base
  before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "You thought you could gain unauthorised access? LOL"
    end
  end

  def restrict_to_admin
    current_user = User.find(session[:user_id]) if session[:user_id]
    unless current_user.is_admin?
      redirect_to koalas_url, notice: 'Admins only!!!'
    end
  end

  def authenticate_user!
    redirect_to login_url unless current_user
  end

end
