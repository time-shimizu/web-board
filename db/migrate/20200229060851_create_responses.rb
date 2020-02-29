class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :user_name
      t.string :content
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
