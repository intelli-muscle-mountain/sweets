class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@orders = Order.all
	end

	def update
		@order = Order.find(params[:id])
  	if  @order.update(order_params)
    	redirect_to admins_order_path
  	else
    	redirect_back(fallback_location: admins_order_path)
	end
	end

	private
    def order_params
      	params.require(:order).permit(:order_status, :item_status)
    end

end
