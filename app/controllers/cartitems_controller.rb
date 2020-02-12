class CartitemsController < ApplicationController

	def index
		@cartitems = Cartitem.where(customer_id: current_customer.id)
		@order = Order.new
		@total_price = 0
	end

	def create
		cartitem = Cartitem.new(cartitem_params)
		cartitem.customer_id = current_customer.id
     if cartitem.save
     	redirect_to cartitems_path
     else
     	cartitems = Cartitem.all
     	render "items/show"
 		end
	end

	def update
		cartitem = Cartitem.find(params[:id])
		cartitem.update(cartitem_params)
    	redirect_to cartitems_path(cartitem.id)
	end

	def destroy
		cartitem = Cartitem.find(params[:id])
	    cartitem.destroy
		redirect_to cartitems_path
	end

	def destroy_all
		cartitem = Cartitem.where(customer_id: current_customer.id)
	    cartitem.destroy_all
	    redirect_to cartitems_path
	end

	private
	def cartitem_params
		params.require(:cartitem).permit(:item_id,:customer_id,:quantity)
	end

end

