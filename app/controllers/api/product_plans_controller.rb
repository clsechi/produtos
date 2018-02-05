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
        product = Product.find_by(id: product_plan.product_id)
        category = ProductCategory.find_by(id: product.product_category_id)
        abc = []
        abc << product_plan << product << category

        render json: abc
      end
    end
  end
end
