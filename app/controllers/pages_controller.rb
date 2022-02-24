class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[home]

  def home
    #
  end

  def portfolio
    #
  end

  def account
    #
  end
end
