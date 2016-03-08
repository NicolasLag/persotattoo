class RenameColumnToOrder < ActiveRecord::Migration
  def change
    rename_column :orders, :teddy_sku, :project_sku
  end
end
