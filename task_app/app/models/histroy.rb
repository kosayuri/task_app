class Histroy < ApplicationRecord
    validates :user_id, {presence: true}
    validates :room_id, {presence: true}
    validates :start_day, {presence: true}
    validates :end_day, {presence: true}
    validates :count, presence: true , numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9999999}
    validate :start_end_check
    validate :start_check

    def start_end_check
        errors.add(:end_day, "は開始日より前の日付で登録できません。") if self.start_day.nil? ||  self.end_day.nil? || self.start_day > self.end_day
    end

    def start_check
        errors.add(:start_day, "は現在の日時より遅い時間を選択してください") if self.start_day.nil? ||  self.start_day < Time.now
    end
end
