class InboxController < ApplicationController
  before_action :set_user, only: %i[chat]

  def index
    @users = User.all.where.not(id: current_user)
  end

  def chat
    @current_user = current_user
    
    # logger.debug @user.data
    @chat = Chat.new
    @my_chats = Chat.all.where(sender_id: current_user.id, receiver_id: params[:id]).order(created_at: :asc)
    @other_chats = Chat.all.where(sender_id: params[:id], receiver_id: current_user.id).order(created_at: :asc)
    @chats = (@my_chats.as_json).push(@other_chats.as_json.first).compact
    # logger.debug @chats
    # unless @chats != []
    @sorted_chats = @chats.sort_by { |c| c["created_at"] }
    # end
    # logger.debug hi
    # @chats.each do |cha|
    #   logger.debug cha['id']
    #   # logger.debug cha[:id]
    #   # logger.debug cha.id
    # end
   
  end

  def get_chat
    @current_user = current_user
    
    # logger.debug @user.data
    @chat = Chat.new
    @my_chats = Chat.all.where(sender_id: current_user.id, receiver_id: params[:id]).order(created_at: :asc)
    @other_chats = Chat.all.where(sender_id: params[:id], receiver_id: current_user.id).order(created_at: :asc)
    @chats = (@my_chats.as_json).push(@other_chats.as_json.first).compact
    # logger.debug @chats
    # unless @chats != []
    @sorted_chats = @chats.sort_by { |c| c["created_at"] }
    # end
    # logger.debug hi
    # @chats.each do |cha|
    #   logger.debug cha['id']
    #   # logger.debug cha[:id]
    #   # logger.debug cha.id
    # end
    render json: {
      sorted_chats: @sorted_chats,
      user: set_user
    }
  end
  

 

  def create
    @chat = Chat.create(message: params[:chat][:message], sender_id: current_user.id, receiver_id: params[:id])
    logger.debug "This is the current user " + current_user.id.to_s
    logger.debug params
    logger.debug @chat.message 
    logger.debug @chat.sender_id
    logger.debug @chat.receiver_id
    respond_to do |format|
      if @chat.save
        format.html { redirect_to "/inbox/#{params[:id]}" ,notice: "Message was successfully sent." }
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
