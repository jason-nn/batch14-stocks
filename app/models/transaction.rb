class Transaction < ApplicationRecord
  belongs_to :user

  validates :action,
            presence: true,
            inclusion: {
              in: ['cash in', 'purchase', 'sale'],
            }
  validates :amount, presence: true
end
