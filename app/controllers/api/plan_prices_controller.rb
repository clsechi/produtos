module Api
  class PlanPricesController < ApplicationController
    before_action :check_errors, only: [:index]
    def index
      prices = last_prices(params[:product_plan_id])
      json = prices.as_json(except: [:created_at, :updated_at, :periodicity_id])
      prices.each_with_index do |price, index|
        periodicity = price.periodicity
        json[index]['periodicity'] = periodicity.as_json(except:
                                              [:created_at, :updated_at])
      end
      render json: { plans: params[:product_plan_id].to_i, prices: json }
    end

    private

    def last_prices(id)
      prices = []
      Periodicity.all.find_each do |per|
        price = PlanPrice.where(['periodicity_id = ? and product_plan_id = ?',
                                 per.id, id]).last
        prices << price unless price.nil?
      end
      prices
    end

    def check_errors
      ProductPlan.find(params[:product_plan_id])
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum plano encontrado' }, status: 404
    end
  end
end
