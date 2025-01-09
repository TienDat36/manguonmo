class AddUserIdToSubscribers < ActiveRecord::Migration[8.0]
  def change
    add_column :subscribers, :user_id, :integer
  end
end
