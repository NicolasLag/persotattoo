class AddContentToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :content, :text
  end
end
