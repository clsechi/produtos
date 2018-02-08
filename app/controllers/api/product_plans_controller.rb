module Api
  class ProductPlansController < ApplicationController
    def index
      product_plans = ProductPlan.where(product_id: params[:product_id])
      json = product_plans.as_json(except: [:created_at, :updated_at])
      render json: { products: { id: params[:product_id] }, plans: json }
    end

    def price
      price = PlanPrice.where(product_plan_id: params[:id])
      return render json: price unless price.empty?
      render json: { message: 'Nenhum preço encontrado' }, status: 404
    end

    def show
      product_plan = ProductPlan.find(params[:id])
      json = product_plan.as_json(except: [:created_at, :updated_at])
      render json: { plans: json }, status: 200
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum plano encontrado' }, status: 404
    end
  end
end
