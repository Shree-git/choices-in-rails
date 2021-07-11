class InboxController < ApplicationController
  before_action :set_user, only: %i[chat]

  def index
    @users = User.all.where.not(id: current_user)
  end

  def chat
    @current_user = current_user
    # logger.debug @user.data
    @chat = Chat.new
  end

  def create
    @chat = Chat.create(message: params[:message], sender_id: current_user, receiver_id: params[:id])

    respond_to do |format|
      if @chat.save
        # format.html { notice: "Message was successfully sent." }
      else
        # format.html { status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def chat_params
      params.require(:chat).permit(:message, :sender_id, :receiver_id)
    end
end
