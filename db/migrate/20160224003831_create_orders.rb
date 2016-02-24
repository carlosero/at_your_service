class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :waiter, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.references :table, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
