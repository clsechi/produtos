module Api
  class ProductsController < ApplicationController
    def index
      products = Product.all
      if products.empty?
        render json: products, status: 404
      else
        render json: products
      end
    end
  end
end
