class RemovePriceFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :price, :integer
    add_column :projects, :price_cents, :integer, default: 0, null: false
  end
end
