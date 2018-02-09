module Api
  class PlanPricesController < ApplicationController
    def index
      prices = PlanPrice.where(product_plan_id: params[:product_plan_id])
      json = prices.as_json(except: [:created_at, :updated_at, :periodicity_id])
      prices.each_with_index do |price, index|
        periodicity = price.periodicity
        json[index]['periodicity'] = periodicity.as_json(except:
                                              [:created_at, :updated_at])
      end
      render json: { plans: params[:product_plan_id].to_i, prices: [json.last] }
    end
  end
end
