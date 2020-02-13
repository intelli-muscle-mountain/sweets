class OrdersController < ApplicationController

	def new
	@order = Order.new
  @total_price = 0
  address = Address.all
	end

	def create
		@order = Order.new
	end

	def index
	end

	def show
	end

	def thanks
	end

	def confirm
		@order = Order.new(order_params)
		@orders = Order.where(customer_id: current_customer.id)
	end

def order_params
params.require(:order).permit(:customer_id,:payment,:freight,:order_status,:total_price,:destination_name,:postal_code,:address)
end
	
end