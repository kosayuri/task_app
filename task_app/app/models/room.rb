class Room < ApplicationRecord
    validates :name, {presence: true, length: {maximum:30}}
    validates :money, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999}
    validates :address, {presence: true}
    validates :user_id, {presence: true}
end
