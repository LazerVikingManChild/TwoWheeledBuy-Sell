class Post < ApplicationRecord
    # validates :price, presence: true
    belongs_to :user  
    has_many_attached :image
end
