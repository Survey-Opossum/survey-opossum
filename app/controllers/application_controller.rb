class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    Author.where(id: session[:id]).first
  end

  helper_method :current_user

  def logged_in?
    if current_user
      redirect_to surveys_path
    end
  end

  def taker?
    unless current_user
      redirect_to root_path
    end
  end


end
