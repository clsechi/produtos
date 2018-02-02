module Api
  class ProductsController < ApplicationController
    def index
      products = Product.all
      if products.empty?
        render json: { message: 'Nenhum produto encontrado', status: :ok }
      else
        render json: products
      end
    end
  end
end
