module Api
  class ProductsController < ApplicationController
    def index
      product = Product.where(product_category_id: params[:category_id])
      json = product.as_json(except: [:created_at, :updated_at])
      render json: { categories: { id: params[:category_id] }, products: json }
    end
  end
end
