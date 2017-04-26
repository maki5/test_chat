class HomeController < ApplicationController

  def index
    @rooms = ChatRoom.all
  end

  def login
    session['user_name'] = params[:user_name]
    ActiveUser.create(user_name: params[:user_name], logged_in: DateTime.now)
    session['dialect'] = params[:dialect]

    redirect_to chat_room_path(params[:chat_room])
  end
end