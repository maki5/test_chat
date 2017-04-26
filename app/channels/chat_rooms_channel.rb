class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    message = TranslationService.translate_message(data['message'], data['dialect'])

    Message.create(body: message, chat_room_id: data['chat_room_id'], user_name: data['user_name'],
                   dialect: data['dialect'])
  end
end