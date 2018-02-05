module Api
  class ProductPlansController < ApplicationController
    def index
      product_plans = ProductPlan.all
      if product_plans.empty?
        render json: { message: 'Nenhum plano encontrado', status: :ok }
      else
        render json: product_plans
      end
    end

    def price
      price = PlanPrice.where(product_plan_id: params[:id])
      if price.empty?
        render json: price, status: 404
      else
        render json: price
      end
    end
  end
end
