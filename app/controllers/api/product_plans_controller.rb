module Api
  class ProductPlansController < ApplicationController
    def index
      product_plan = ProductPlan.all
      if product_plan.empty?
        render json: product_plan, status: 404
      else
        render json: product_plan
      end
    end

    def price
      price = PlanPrice.where(product_plan_id: params[:id])
      render json: price
    end
  end
end
