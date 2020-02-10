class Admins::ItemsController < ApplicationController
	def top
	end

	def index
	end

	def show
	end

	def new
		@item = Item.new
		@genres = Genre.all
	end

	def create
		@item = Item.new
	end

	def edit
	end

	def update
	end
end

