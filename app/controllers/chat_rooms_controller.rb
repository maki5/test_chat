class ChatRoomsController < ApplicationController


  def show
    if !session['user_name'].nil?
      @chat_room = ChatRoom.includes(:messages).find(params[:id])
      @message = Message.new
    else
      redirect_to root_path
    end
  end
end