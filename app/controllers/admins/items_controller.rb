class Admins::ItemsController < ApplicationController

	def top
	end

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
		@item_tax = (@item.price * 1.1).floor
	end

	def new
		@item = Item.new
		@genres = Genre.all
	end

	def create
		@item = Item.new(item_params)
		@genres = Genre.all
		if @item.save
			redirect_to admins_item_path(@item)
		else
			render 'new'
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			redirect_to admins_item_path
		else
			render "edit"
		end
	end

private
	def item_params
		params.require(:item).permit(:genre_id,:name,:description,:price,:sale_status,:image)
	end

end

