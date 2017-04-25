class ChatRoomsController < ApplicationController


  def show
    @room = ChatRoom.find(params[:id])
  end
end