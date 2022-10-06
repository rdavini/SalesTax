class Api::V1::ItemsController < ApplicationController
    skip_before_action :verify_authenticity_token  

    def index
      begin
        # query = getQuery(params)  

        # #refactor products and total_products should be fetched in one query, check if this is possible without affecting the pagination
        # #and heap alocation
        # products = Product.where(query).page(params[:page])
        # total_products = Product.where(query).count

        # render status: 200, json: [data: products, total: total_products]
        render status: 200, json: [data: '', total: '']
      rescue Exception => e
        render status: 404, json: e.message
      end
    end

    def create
        begin
            item = Item.create(item_params)
            if item
              render status: :created, json: 'Item created succefully!'
            else
              render json: item.errors, status: :unprocessable_entity
            end
        rescue Exception => e
          render status: 404, json: e.message
        end
    end

    private
    
    def item_params
        params.require(:item).permit([:desc, :price, :qty])
    end
     
end
  