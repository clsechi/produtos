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
