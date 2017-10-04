class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  validates :body, length: { maximum: 500, wrong_length: "%{count} characters is the maximum allowed" }
  def message_time
    created_at.in_time_zone('Brasilia')
  end
end
