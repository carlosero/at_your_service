class AddActiveToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :active, :boolean, :default => true
  end
end
