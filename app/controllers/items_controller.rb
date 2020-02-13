class ItemsController < ApplicationController
	def index
		@item = Item.all
	end

	def show
		@item = Item.find(params[:id])
		@cartitem = Cartitem.new
		@genres = Genre.all
	end


 private
	def item_params
		params.require(:item).permit(:genre_id,:name,:description,:price,:sale_status,:image)
	end
end
