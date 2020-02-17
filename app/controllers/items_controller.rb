class ItemsController < ApplicationController
	def index
		@item = Item.all
	end

	def show
		@item = Item.find(params[:id])
		@cartitem = Cartitem.new
		@genres = Genre.all
	end

end
