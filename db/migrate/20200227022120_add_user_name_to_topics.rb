class AddUserNameToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :user_name, :string
  end
end
