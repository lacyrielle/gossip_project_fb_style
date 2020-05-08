class Like < ApplicationRecord
    belongs_to :user
    belongs_to :gossip
    
    def self.like(gossip_id, user_id)
        Like.where(gossip_id: gossip_id, user_id: user_id).count > 0
    end
end
