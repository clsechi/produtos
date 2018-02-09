module Api
  class ProductsController < ApplicationController
    def index
      products = Product.where(product_category_id: params[:category_id])
      json = products.as_json(except: [:created_at, :updated_at,
                                       :icon_file_name, :icon_content_type,
                                       :icon_file_size, :icon_updated_at])
      indice = 0
      products.each do |product|
        json[indice]['icon_url'] = product.icon.url(:thumb)
        indice += 1
      end
      render json: { categories: { id: params[:category_id] }, products: json }
    end

    def show
      product = Product.find(params[:id])
      json = product.as_json(except: [:created_at, :updated_at, :icon_file_name,
                                      :icon_content_type, :icon_file_size,
                                      :icon_updated_at])
      json['icon_url'] = product.icon.url(:thumb)
      render json: { products: json }
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum produto encontrado' }, status: 404
    end
  end
end
