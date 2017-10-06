class ConversationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @users = User.all
    @conversations = policy_scope(Conversation)
    @mine_conversations = @conversations.mine(current_user.id)
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    authorize(@conversation)
    redirect_to conversation_messages_path(@conversation)

  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
