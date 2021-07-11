class InboxController < ApplicationController
  def index
    @users = User.all.where.not(id: current_user)
  end

  def chat
    @current_user = current_user
    @user = User.find(params[:id])
    # logger.debug @user.data
  end
end
