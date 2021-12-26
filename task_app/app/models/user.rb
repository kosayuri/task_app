class User < ApplicationRecord
    has_secure_password

    validates :name, {presence: true, length: {maximum:30}}
    validates :email, {presence: true, length: {maximum:100}}
end
