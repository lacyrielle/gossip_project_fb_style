class User < ApplicationRecord

    has_secure_password


    belongs_to :city
    has_many :gossips
    has_many :comments
    has_many :likes

    validates :first_name,
        presence: true
        
  
    validates :last_name,
        presence: true
  
    validates :age,
        numericality: { greater_than: 0 }
  
    validates :email,
        presence: true,
        uniqueness: true,
        format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Wrong format!" }
  
    validates :password,
        presence: true,
        length: { minimum: 6 }

end
