class ChatRoom < ActiveRecord::Base
  has_many :messages
end