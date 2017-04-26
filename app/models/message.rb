class Message < ActiveRecord::Base
  belongs_to :chat_room

  after_create_commit :message_broadcast

  def message_broadcast
    ActionCable.server.broadcast "chat_rooms_#{self.chat_room.id}_channel",
                                 message: render_message(self)
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: {message: message}
  end
end