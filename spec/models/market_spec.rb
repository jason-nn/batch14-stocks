require 'rails_helper'

RSpec.describe Market, type: :model do
  # before :each do
  #   @market = create(:market)
  # end

  context 'Validations' do
    it 'should be saved when all information is provided ' do
      market = Market.new(stock: 'GOOG', price: 2500, company: 'Alphabet Inc.')
      expect(market.save).to eq true
    end

    it 'should not be saved when stock is an empty string' do
      market = Market.new(stock: '', price: 2500, company: 'Alphabet Inc.')
      expect(market.save).to eq false
    end

    it 'should not be saved when price is an empty string' do
      market = Market.new(stock: 'GOOG', price: '', company: 'Alphabet Inc.')
      expect(market.save).to eq false
    end

    it 'should not be saved when company is an empty string' do
      market = Market.new(stock: 'GOOG', price: 2500, company: '')
      expect(market.save).to eq false
    end

    it 'should not be saved when stock is nil' do
      market = Market.new(stock: nil, price: 2500, company: 'Alphabet Inc.')
      expect(market.save).to eq false
    end

    it 'should not be saved when price is nil' do
      market = Market.new(stock: 'GOOG', price: nil, company: 'Alphabet Inc.')
      expect(market.save).to eq false
    end

    it 'should not be saved when company is nil' do
      market = Market.new(stock: 'GOOG', price: 2500, company: nil)
      expect(market.save).to eq false
    end
  end
end
