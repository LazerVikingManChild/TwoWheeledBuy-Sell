class RenameSellerIdToUserId < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :seller_id, :user_id
  end
end
