class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.string :food_type
      t.decimal :price, :precision => 9, :scale => 2

      t.timestamps null: false
    end
  end
end
