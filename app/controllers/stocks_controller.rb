class StocksController < ApplicationController
	def search
		if params[:stock].present?
				@stock = Stock.new_lockup(params[:stock])
			if @stock
				respond_to do |format|
					format.js { render partial: 'users/result'}
				end
			else
				respond_to do |format|
					flash.now[:alert]= "please enter valid symbol"
					format.js { render partial: 'users/result'}
				end
			end
		else
			respond_to do |format|
					flash.now[:alert]= 'please enter symbol to search'
					format.js { render partial: 'users/result'}
				end
		end
	end
end