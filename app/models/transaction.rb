class Transaction < ApplicationRecord
  belongs_to :user

  validates :action, presence: true
  validates :amount, presence: true
end
