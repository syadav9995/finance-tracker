class UsersController < ApplicationController
  def my_portfolio
    @tracked_stock = current_user.stocks 
  end
end
