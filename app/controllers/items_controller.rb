class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			redirect_to @item
		else
			render 'new'
		end
	end

	def edit
	end

	def delete
	end

	def show
		@item = Item.find(params[:id])
	end

	private

	def item_params
		params.require(:item).permit(:title, :inventory, :description, :business_id, :photo_url)
	end
end
