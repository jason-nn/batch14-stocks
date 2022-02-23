require 'rails_helper'

RSpec.describe 'Transactions Request Spec', type: :request do
  before :each do
    @user = create(:user)
    sign_in @user
  end

  it 'cashin' do
    get cashin_path
    expect(response).to have_http_status(200)
    expect(response).to render_template(:cashin)
  end
end
