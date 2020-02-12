class Chat < ApplicationRecord
    belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
    belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
    has_many :messages, dependent: :destroy
    validates_uniqueness_of :sender_id, :scope => :recipient_id
    
    scope :between_sender_and, -> (sender_id,recipient_id) do
        where(sender_id: sender_id, recipient_id: recipient_id)
    end
    scope :between, -> (u_id_1, u_id_2) { between_sender_and(u_id_1, u_id_2) + between_sender_and(u_id_2, u_id_1) }
end
