class UserStocksController < ApplicationController
	def create
		stock = Stock.check_db(params[:ticker])

		if stock.blank?
			stock = Stock.new_lockup(params[:ticker])
			stock.save
		end
		@user_stock = UserStock.create(user: current_user, stock: stock)
		flash[:notice]="Stock #{stock.name} has been added to your portfolio"
		redirect_to my_portfolio_path
	end

	def destroy
		binding.pry
		stock = Stock.find(params[:id])
		user_stock = UserStock.where(user_id: current_user.id, stock_id: stock).last
		user_stock.destroy
		flash[:alert] = "stock deleted sucessfully"
		redirect_to my_portfolio_path
	end
end
