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
  end
end
