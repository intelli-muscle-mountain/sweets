class OrdersController < ApplicationController
	before_action :authenticate_customer!

	def new
		@addresses = Address.where(customer_id:current_customer.id)
	end

	def create
		order = Order.new(order_params)
		if order.save
			current_customer.cartitems.each do | item |
				order_item =OrderItem.new(order_id: order.id)
				order_item.item_id = item.item_id
				order_item.price = item.item.price
				
				order_item.quantity = item.quantity
				order_item.save

			end
		else
			render 'confirm'
		end
		current_customer.cartitems.destroy_all
		redirect_to thanks_orders_path
	end

	def index
		@orders = Order.where(customer_id: current_customer.id)
	end

	def show
		@order = Order.find(params[:id])
	end

	def thanks
	end

	def confirm
		@total_price = 0
		@order = Order.new
		@order.payment = params[:payment]
		@cartitems = Cartitem.where(customer_id: current_customer.id)
		if params[:address] == "新しいお届け先"
			@order.postal_code = params[:postal_code]
			@order.address = params[:new_address]
			@order.destination_name = params[:destination_name]
		elsif params[:address] == "選択住所"
			address = Address.find_by(id: params[:address_id])
			@order.postal_code = address.postal_code
			@order.address = address.address
			@order.destination_name = address.destination_name
		elsif params[:address] == "ご自身の住所"
			@order.postal_code = current_customer.postal_code
			@order.address = current_customer.address
			@order.destination_name = current_customer.full_name
		end
	end

	private
	def order_params
		params.require(:order).permit(:customer_id,:payment,:freight,:order_status,:total_price,:destination_name,:postal_code,:address)
	end
end