module Api
  class ProductsController < ApplicationController
    def index
      product = Product.where(product_category_id: params[:category_id])
      json = product.as_json(except: [:created_at, :updated_at])
      render json: { categories: { id: params[:category_id] }, products: json }
    end

    def show
      product = Product.find(params[:id])
      json = product.as_json(except: [:created_at, :updated_at])
      render json: { products: json }
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum produto encontrado' }, status: 404
    end
  end
end
