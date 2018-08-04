class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      # render :json
    else
      render :json, @user.errors.full_messages, status: 418
    end
  end

  def destroy
    if logout
      render :json {}
    else
      render :json '404', status: 404
  end
end
