class Gossip < ApplicationRecord
    belongs_to :user
    has_many :gossips_tags
    has_many :tags, through: :gossips_tags
    has_many :comments
    has_many :likes

    validates :title,
        presence: true,
        length: { in: 3..14, 
        too_short: " must have at least %{count} characters",
        too_long: " must have at most %{count} characters"
        }

  validates :content,
    presence: true


end
