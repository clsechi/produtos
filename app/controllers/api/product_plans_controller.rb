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
  end
end
