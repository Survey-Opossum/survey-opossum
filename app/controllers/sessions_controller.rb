class SessionsController < ApplicationController
  before_action :logged_in?, except: [:destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if request.post?
      a = Author.find_by_email(params[:email])
        if a && a.authenticate(params[:password])
          session[:id] = a.id
          redirect_to surveys_path, notice: "You've logged in."
          return
        else
          redirect_to root_path, notice: "Wrong email or password."
          return
        end
    end
  end

  def update
  end

  def destroy
    session[:id] = nil
    redirect_to root_path, notice: "You've logged out."
  end
end
