class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :furniture, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
