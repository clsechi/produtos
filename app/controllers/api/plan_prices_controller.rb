module Api
  class PlanPricesController < ApplicationController
    def index
      prices = PlanPrice.where(product_plan_id: params[:product_plan_id])
      json = prices.as_json(except: [:created_at, :updated_at, :periodicity_id])
      indice = 0
      prices.each do |price|
        periodicity = price.periodicity
        json[indice]['periodicity'] = periodicity.as_json(except:
                                              [:created_at, :updated_at])
        indice += 1
      end
      render json: { plans: params[:product_plan_id].to_i, prices: [json.last] }
    end
  end
end
