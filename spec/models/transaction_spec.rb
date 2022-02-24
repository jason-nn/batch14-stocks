require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before :each do
    @user = create(:user)
  end

  it 'should be saved when required information is provided with valid action' do
    transaction = @user.transactions.create(action: 'cash in', amount: 10_000)
    expect(transaction.save).to eq true
  end

  it 'should not be saved when required information is provided with invalid action' do
    transaction = @user.transactions.create(action: 'cash ins', amount: 10_000)
    expect(transaction.save).to eq false
  end

  it 'should not be saved when required information is an empty string' do
    transaction = @user.transactions.create(action: '', amount: '')
    expect(transaction.save).to eq false
  end

  it 'should not be saved when required information is nil' do
    transaction = @user.transactions.create(action: nil, amount: nil)
    expect(transaction.save).to eq false
  end

  it 'should not be saved when action is nil' do
    transaction = @user.transactions.create(action: nil, amount: 10_000)
    expect(transaction.save).to eq false
  end

  it 'should not be saved when amount is nil' do
    transaction = @user.transactions.create(action: 'cash in', amount: nil)
    expect(transaction.save).to eq false
  end
end
