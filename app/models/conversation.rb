class Conversation < ApplicationRecord


  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end

  scope :mine, -> (user_id) do
    where("(conversations.sender_id = ? OR conversations.recipient_id =?)", user_id, user_id,)
  end
end
