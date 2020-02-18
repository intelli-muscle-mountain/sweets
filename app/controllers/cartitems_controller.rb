class CartitemsController < ApplicationController
	before_action :authenticate_customer!

	def index
		@cartitems = Cartitem.where(customer_id: current_customer.id)
		@order = Order.new
		@total_price = 0
	end

	def create
		@genres = Genre.all
		@cartitem = Cartitem.new(cartitem_params)
		@cartitem.customer_id = current_customer.id
		@item = Item.find(@cartitem.item_id)
		cartitems = Cartitem.where(customer_id: current_customer.id)
		if cartitems.find_by(item_id: @cartitem.item_id).present?
			cartitem = cartitems.find_by(item_id: @cartitem.item_id)
			cartitem.quantity += @cartitem.quantity
			cartitem.save(cartitem_params)
			redirect_to cartitems_path
    	else
    		if @cartitem.save
     			redirect_to cartitems_path
	    	else
		     	redirect_back(fallback_location: item_path(@cartitem.item_id))
	 		end
	 	end
	end

	def update
		@cartitems = Cartitem.where(customer_id: current_customer.id)
		@order = Order.new
		@total_price = 0
		cartitem = Cartitem.find(params[:id])
		if cartitem.update(cartitem_params)
    		redirect_to cartitems_path(cartitem.id)
    	else
    		render 'index'
    	end
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

