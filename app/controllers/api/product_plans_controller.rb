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
    product_plan = ProductPlan.find(params[:id])
    if product_plan.nil?
      render json: { message: 'Nenhum plano encontrado', status: :not_found }
    else
      #(Duracao, id_produto)
      product = Product.find_by(id: product_plan.product_id)
      #(nome, descircao, chave, id_categoria)
      category = ProductCategory.find_by(id: product.product_category_id)
      #(nome, descricao)
      #price = PlanPrice.find_by(product_plan_id, plan_id)

      abc = []
      abc << product_plan << product << category
      #abc = product_plan + product + category + price
      #merge

      render json: abc
      end
    end
  end
end
