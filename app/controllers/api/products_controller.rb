module Api
  class ProductsController < ApplicationController
    def index
      products = Product.all
      return render json: products unless products.empty?
      render json: { message: 'Nenhum produto encontrado' }, status: 404
    end
  end
end
