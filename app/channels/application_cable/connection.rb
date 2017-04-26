module ApplicationCable
  class Connection < ActionCable::Connection::Base

    def user_name
      session['user_name']
    end
  end
end
