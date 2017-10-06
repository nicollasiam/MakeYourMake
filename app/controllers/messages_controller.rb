class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = policy_scope(Message)
    @messages = @conversation.messages
    if @messages.length > 10
     @over_ten = true
     @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
        @messages.last.save
      end
    end
    @message = @conversation.messages.new
    if @conversation.sender == current_user
      @listener = @conversation.recipient
    else
      @listener = @conversation.sender
    end
    if @messages[0].body.nil?
      @first_message = true
    end


  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
    authorize(@message)
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end
