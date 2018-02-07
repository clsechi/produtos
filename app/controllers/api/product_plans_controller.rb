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

    def show
      product_plan = ProductPlan.find_by(id: params[:id])
      if product_plan.nil?
        render json: { message: 'Nenhum plano encontrado' }, status: 404
      else
        render json: product_plan
      end
    end
  end
end
