class SearchController < ApplicationController

      def index
        if params[:item_search]
          @items = Item.where("lower(title) LIKE ?", "%#{search_params[:item_search].downcase}%")
          flash[:notice] = "No items were found by that title" if @items.empty?
        elsif params[:category_search]
          @category = Category.find_by(name: search_params[:category_search].downcase)
          @items = Item.where("category_id = ?", "#{@category.id}")
        end

          render 'items/index'
      end

      private
      def search_params
        params.permit(:item_search, :category_search)
      end
end
