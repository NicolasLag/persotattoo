class CreateHiddenProjects < ActiveRecord::Migration
  def change
    create_table :hidden_projects do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
