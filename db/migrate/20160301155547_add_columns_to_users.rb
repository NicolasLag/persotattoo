class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :artist, :boolean
    add_column :users, :address_street, :string
    add_column :users, :address_city, :string
    add_column :users, :address_postal_code, :string
    add_column :users, :address_country, :string
    add_column :users, :presentation, :text
    add_column :users, :gender, :boolean
    add_column :users, :url, :string
    add_column :users, :phone_number, :string
    add_column :users, :profile_picture, :string
  end
end
