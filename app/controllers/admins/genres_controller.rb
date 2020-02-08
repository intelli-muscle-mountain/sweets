class Admins::GenresController < ApplicationController

	def index
		@genre = Genre.new
		@genres = Genre.all

	end

	def edit
		@genre = Genre.find(params[:id])
        redirect_to edit_admins_genre_path(@genre.id)
	end

	def create
		@genre = Genre.new(genre_params)
  		if @genre.save
  		redirect_to admins_genres_path
    	else
      	@genres = Genre.all
  		render :index
    	end
	end


	def update
		@genre = Genre.find(params[:id])
    	if @genre.update(genre_params)
      	redirect_to admins_genres_path
    	else
      	render :edit
  		end
	end


private

    def genre_params
      	params.require(:genre).permit(:genre_name, :genre_status)
    end
end
