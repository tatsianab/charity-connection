class SearchController < ApplicationController

      def index
          @items = Item.where("lower(title) LIKE ?", "%#{search_params[:search].downcase}%")
          flash[:notice] = "No items were found by that title" if @items.empty?
          render 'items/index'
      end

      private
      def search_params
        params.permit(:search)
      end
end
