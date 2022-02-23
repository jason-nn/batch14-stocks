class Market < ApplicationRecord
  validates :stock, presence: true
  validates :price, presence: true
  validates :company, presence: true
end
