class Gift < ApplicationRecord
  belongs_to :user
  belongs_to :giver, class_name: 'User'

  validates :user_id, presence: true
  validates :giver_id, presence: true
end
