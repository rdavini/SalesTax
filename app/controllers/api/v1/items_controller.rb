class Api::V1::ItemsController < ApplicationController
    skip_before_action :verify_authenticity_token  

    def index
      begin
        # total_info = get_total_cost items

        render status: 200, json: Item.all
      rescue Exception => e
        render status: 404, json: e.message
      end
    end

    def create
        begin
            Item.destroy_all
            items = Item.create!(JSON.parse(params[:_json].to_json)) if params[:_json].present?

            if items.count
              render status: :created, json: 'Items created succefully!'
            else
              render json: item.errors, status: :unprocessable_entity
            end
        rescue Exception => e
          render status: 404, json: e.message
        end
    end

    # if there are many records the total_cost/total_tax should not be calculated in runtime
    def get_total_cost
      items = Item.all
      total_cost_tax = 0
      total_cost_no_tax = 0
      items.each do |it|
        total_cost_no_tax += it.price*it.qty
        total_cost_tax += it.total_price
      end

      render status: 200, json: {
        "total_cost": total_cost_tax.round(2),
        "total_tax": ItemHelper.round_to(total_cost_tax - total_cost_no_tax)
      }
    end

    private

    def item_params
        params.require(:items).permit([:desc, :price, :qty])
    end
end
  