class CreateFoodsOrders < ActiveRecord::Migration
  def change
    create_table :foods_orders do |t|
      t.references :food, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
