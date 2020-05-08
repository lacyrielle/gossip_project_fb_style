class Tag < ApplicationRecord
    has_many :gossips_tags
    has_many :gossips, through: :gossips_tags

    validates :title,
        presence: true,
        length: { in: 3..14 }
end
