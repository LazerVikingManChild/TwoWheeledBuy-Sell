class Post < ApplicationRecord
    validates :price, presence: true
    # belongs_to :user  
end
