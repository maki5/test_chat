class CreateActiveUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :active_users do |t|
      t.string :user_name
      t.datetime :logged_in
    end
  end
end
