class AddActiveToWaiters < ActiveRecord::Migration
  def change
    add_column :waiters, :active, :boolean, :default => true
  end
end
