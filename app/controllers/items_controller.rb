class ItemsController < ApplicationController
	before_action :valid_business?, only: [:new, :create, :edit]

	def index
	    @items = Item.all
           
	end

	def business_items
		@user = User.find(session[:user_id]) 
		@items = Item.where(business_id: @user.id)
    
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
		 @item = Item.find(params[:id])
	end

	def update
    	@item = Item.find(params[:id])
		if @item.update_attributes(item_params)
	 	   redirect_to @item
	 	else
	 		flash[:notice] = "Sorry, we cant update this item"
    		render 'edit'
  		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path
	end

	def show
		@item = Item.find(params[:id])
	end

	private

	def item_params
		params.require(:item).permit(:title, :inventory, :description, :business_id, :photo_url, :category_id)
	end

end
