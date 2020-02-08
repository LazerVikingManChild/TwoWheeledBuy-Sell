class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer "seller_id"
      t.integer "price"
      t.string "title"
      t.text "description"
      
    end
  end
end
