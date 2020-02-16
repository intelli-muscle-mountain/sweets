class OrdersController < ApplicationController

	def new
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
		end
			current_customer.cartitems.destroy_all
			redirect_to thanks_orders_path
	end

	def index
	end

	def show
	end

	def thanks
	end

	def confirm
			@total_price = 0
			@order = Order.new
			@order.payment = params[:payment]
			@cartitems = Cartitem.where(customer_id: current_customer.id)
		if params[:address] == "新しいお届け先"
			@order.postal_code = params[postal_code]
			@order.address = params[new_address]
			@order.destination_name = params[destination_name]
		elsif params[:address] == "選択住所"
			address = Address.find_by(id: params[address_id])
			@order.postal_code = address.postal_code
			@order.postal_code = address.address
			@order.postal_code = address.destination_name
		elsif params[:address] == "ご自身の住所"
			@order.postal_code = current_customer.postal_code
			@order.address = current_customer.address
			@order.destination_name = current_customer.last_name
		end
	end

def order_params
	params.require(:order).permit(:customer_id,:payment,:freight,:order_status,:total_price,:destination_name,:postal_code,:address)
end

def order_item_params
	params.require(:order_item).permit(:order_id,:item_id,:price,:quantity,:item_status)
end
end