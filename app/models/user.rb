class User < ApplicationRecord
    has_many :items
    
    validates :email, presence: true
    validates :api_key, presence: true
    validates :id, presence: true

end
