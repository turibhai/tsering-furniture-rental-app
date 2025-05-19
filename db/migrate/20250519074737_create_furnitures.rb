class CreateFurnitures < ActiveRecord::Migration[7.1]
  def change
    create_table :furnitures do |t|
      t.string :name
      t.string :furniture_type
      t.text :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
