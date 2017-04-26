class ActiveUser < ActiveRecord::Base

  def self.now
    ActiveUser.where("logged_in + ? <= ?", 1.hour, DateTime.now)
  end
end