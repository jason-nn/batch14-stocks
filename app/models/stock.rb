class Stock < ApplicationRecord
  validates :symbol, presence: true
  validates :price, presence: true
  validates :company, presence: true
  validates :change_percent, presence: true
end
