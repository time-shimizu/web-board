class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :topic, index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true

      t.timestamps
    end
  end
end
