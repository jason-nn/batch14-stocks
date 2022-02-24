require 'rails_helper'

RSpec.describe 'Pages Request Sepc', type: :request do
  before :each do
    @user = create(:user)
    sign_in @user
  end

  it 'root' do
    get root_path
    expect(response).to have_http_status(200)
    expect(response).to render_template(:home)
  end

  it 'portfolio' do
    get portfolio_path
    expect(response).to have_http_status(200)
    expect(response).to render_template(:portfolio)
  end
end
