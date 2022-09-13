class User < ApplicationRecord
    has_secure_password
    has_many :posts

    validates :username, uniqueness: {case_sensitive:false}
    validates :username, presence: true
    validates :password, presence: true
    validates :home_location_code, presence: true
    validates :home_location_code, length: { in: 5..6 }
end
