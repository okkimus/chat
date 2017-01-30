class SessionsController < ApplicationController
  def new
    # reder signin
  end

  def create
    # get the user from db
    user = User.find_by name: params[:name]
    if user.nil?
      redirect_to :back, notice: "User #{params[:name]} does not exist"
    else
      # save user_id to session
      session[:user_id] = user.id if not user.nil?
      # redirect_to user
      redirect_to user, notice: "Welcome back #{params[:name]}!"
    end
  end

  def destroy
    # reset session
    session[:user_id] = nil
    redirect_to :root
  end
end
