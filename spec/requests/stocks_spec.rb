require 'rails_helper'

RSpec.describe 'Stocks Request Spec', type: :request do
  before :each do
    @user = create(:user)
    sign_in @user
  end

  it 'stocks' do
    get stocks_path
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end
end
