class CustomersController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_customer,only: [:edit,:show,:withdraw]

	def show
		set_customer
		if @customer != current_customer
			redirect_to items_path
		end
	end

	def edit
		set_customer
		if @customer != current_customer
			redirect_to items_path
		end
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			redirect_to customer_path(@customer)
		else
			render 'edit'
		end
	end

	def withdraw
		set_customer
		if @customer != current_customer
			redirect_to items_path
		end
	end

	def status_change
		customer = Customer.find(params[:id])
		customer.update(change_params)
		redirect_to root_path
	end

	def set_customer
        @customer = Customer.find_by(id: params[:id])
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :customer_status)
	end
	def change_params
		params.permit(:customer_status)
	end
end

