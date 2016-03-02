class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :price
      t.string :style
      t.string :place
      t.integer :height
      t.integer :width
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
