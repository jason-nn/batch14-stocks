require 'rails_helper'

RSpec.describe 'Stock Model Spec', type: :model do
  it 'should be saved when all information is provided ' do
    stock = Stock.new(symbol: 'GOOG', price: 2500, company: 'Alphabet Inc.')
    expect(stock.save).to eq true
  end

  it 'should not be saved when symbol is an empty string' do
    stock = Stock.new(symbol: '', price: 2500, company: 'Alphabet Inc.')
    expect(stock.save).to eq false
  end

  it 'should not be saved when price is an empty string' do
    stock = Stock.new(symbol: 'GOOG', price: '', company: 'Alphabet Inc.')
    expect(stock.save).to eq false
  end

  it 'should not be saved when company is an empty string' do
    stock = Stock.new(symbol: 'GOOG', price: 2500, company: '')
    expect(stock.save).to eq false
  end

  it 'should not be saved when symbol is nil' do
    stock = Stock.new(symbol: nil, price: 2500, company: 'Alphabet Inc.')
    expect(stock.save).to eq false
  end

  it 'should not be saved when price is nil' do
    stock = Stock.new(symbol: 'GOOG', price: nil, company: 'Alphabet Inc.')
    expect(stock.save).to eq false
  end

  it 'should not be saved when company is nil' do
    stock = Stock.new(symbol: 'GOOG', price: 2500, company: nil)
    expect(stock.save).to eq false
  end
end
