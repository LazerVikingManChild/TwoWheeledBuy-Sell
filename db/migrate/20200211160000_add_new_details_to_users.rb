class AddNewDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_quote, :string
    add_column :users, :user_description, :text
  end
end
