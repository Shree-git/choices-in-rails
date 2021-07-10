class InboxController < ApplicationController
  def index
    @users = User.all.where.not(id: current_user)
  end

  def chat
    @current_user = current_user
    
  end
end
