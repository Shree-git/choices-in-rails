class InboxController < ApplicationController
  before_action :set_user, only: %i[chat]

  def index
    @users = User.all.where.not(id: current_user)
  end

  def chat
    @current_user = current_user
    @other_user_id = params[:id]
    # logger.debug @user.data
    # @chat = Chat.new
    sort_chats()
    
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
    sort_chats()
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
    logger.debug params
    @chat = Chat.create(message: params[:message], sender_id: current_user.id, receiver_id: params[:id])
    logger.debug "This is the current user " + current_user.id.to_s
    
    logger.debug @chat.message 
    logger.debug @chat.sender_id
    logger.debug @chat.receiver_id
    if @chat.save
      sort_chats()
      render json: @sorted_chats  
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def chat_params
      params.require(:chat).permit(:message, :sender_id, :receiver_id)
    end

    def sort_chats
      @my_chats = Chat.all.where(sender_id: current_user.id, receiver_id: params[:id])
      logger.debug @my_chats.as_json.count
      @other_chats = Chat.all.where(sender_id: params[:id], receiver_id: current_user.id)
      logger.debug @other_chats.as_json
      @chats = (@my_chats.as_json)
      @other_chats.as_json.each do |c|
        @chats << c
      end
      @chats = @chats.compact
      # logger.debug @chats
      # unless @chats != []
      @sorted_chats = @chats.sort_by { |c| c["created_at"] }
    end
end
