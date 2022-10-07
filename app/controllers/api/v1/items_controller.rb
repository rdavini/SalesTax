class Api::V1::ItemsController < ApplicationController
    skip_before_action :verify_authenticity_token  

    def index
      begin
        items = Item.all
        total_info = get_total_cost items

        render status: 200, json: [items: Item.all, total_info: total_info]
      rescue Exception => e
        render status: 404, json: e.message
      end
    end

    def create
        begin
            Item.destroy_all
            items = Item.create!(JSON.parse(params[:_json].to_json)) if params[:_json].present?

            if items
              render status: :created, json: 'Items created succefully!'
            else
              render json: item.errors, status: :unprocessable_entity
            end
        rescue Exception => e
          render status: 404, json: e.message
        end
    end

    private
    # if there are many records the total_cost/total_tax should not be calculated in runtime
    def get_total_cost items
      total_cost_tax = 0
      total_cost_no_tax = 0
      items.each do |it|
        total_cost_no_tax += it.price*it.qty
        total_cost_tax += it.total_price
      end

      return { 
        "total_cost": ItemHelper.round_to(total_cost_tax),
        "total_tax": ItemHelper.round_to(total_cost_tax - total_cost_no_tax)
      }
    end

    def item_params
        params.require(:items).permit([:desc, :price, :qty])
    end
end
  