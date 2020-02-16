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

	def item_status_update
		order_item = OrderItem.find(params[:id])
		order_item.update(order_item_params)
		redirect_to  admins_order_path(order_item.order.id)
	end

	private
    def order_params
      	params.require(:order).permit(:order_status)
    end

    def order_item_params
      	params.require(:order_item).permit(:item_status)
    end

end
