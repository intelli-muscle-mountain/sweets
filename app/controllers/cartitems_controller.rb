class CartitemsController < ApplicationController

	def index
		@cartitems = Cartitem.where(customer_id: current_customer)
	end

	def create
		cartitem = Cartitem.new
		cartitem.customer_id = current_customer.id
     if cartitem.save
     	redirect_to cartitems_path
     else
     	cartitems = cartitem.all
     	render "items/show"
 		end
	end

	def update
	end

	def destroy
	end

	def destroy_all
		redirect_to
	end

end

