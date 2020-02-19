class AddressesController < ApplicationController
	before_action :authenticate_customer!

	def index
		@address = Address.new
		@addresses = Address.where(customer_id: current_customer.id)
	end

	def create
		@address = Address.new(address_params)
		@addresses = Address.all
		@address.customer_id = current_customer.id
		if  @address.save
			redirect_to addresses_path
	  	else
	  		@addresses = Address.all
			render "index"
	  	end
	end


	def edit
		@address = Address.find(params[:id])
		if current_customer.id != @address.customer_id
			# もしcurrent_customer.idと@address.customer_idが異なる場合はitems_pathに遷移する
			redirect_to items_path
		end
	end

	def update
		@address = Address.find(params[:id])
  	if  @address.update(address_params)
    	redirect_to addresses_path
  	else
    	redirect_back(fallback_location: edit_address_path)
	end
	end

	def destroy
		address = Address.find(params[:id])
	    address.destroy
		redirect_to addresses_path
	end



	private
	def address_params
		params.require(:address).permit(:destination_name,:postal_code,:address)
	end
end
