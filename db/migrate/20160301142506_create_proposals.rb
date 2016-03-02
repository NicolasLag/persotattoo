class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.datetime :published_at
      t.datetime :validated_at
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
