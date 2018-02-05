module Api
  class ProductPlansController < ApplicationController
    def index
      product_plans = ProductPlan.all
      return render json: product_plans unless product_plans.empty?
      render json: { message: 'Nenhum plano encontrado' }, status: 404
    end

    def price
      price = PlanPrice.where(product_plan_id: params[:id])
      return render json: price unless price.empty?
      render json: { message: 'Nenhum preço encontrado' }, status: 404
    end
  end
end
