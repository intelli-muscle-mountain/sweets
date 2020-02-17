class ItemsController < ApplicationController
	def index
		@genres = Genre.where(genre_status: true)
		if params[:category].present?
			@genre = @genres.find_by(genre_name: params[:category])
			@items = Item.where(genre_id: @genre.id, sale_status: true)
		else
			@items = Item.joins(:genre).where(sale_status: true, genres:{genre_status: true})
		end
	end

	def show
		@item = Item.find(params[:id])
		@cartitem = Cartitem.new
		@genres = Genre.where(genre_status: true)
		if @item.sale_status == false
			redirect_to root_path
		end
		if @item.genre.genre_status == false
			redirect_to root_path
		end
	end

end
