class Admins::ItemsController < ApplicationController
	def top
	end
	
	def index
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
		@genres = Genre.all
	end

	def create
		@item = Item.new
		@item.save
		redirect_to admins_item_path
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
	end

private
	def item_params
		params.require(:item).permit(:genre_id,:name,:description,:price,:sale_status,:image_id)
	end

end
