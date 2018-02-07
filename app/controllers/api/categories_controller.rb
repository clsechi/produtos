module Api
  class CategoriesController < ApplicationController
    def index
      categories = ProductCategory.all
      json = categories.as_json(except: [:created_at, :updated_at])
      render json: { categories: json }
    end

    def show
      category = ProductCategory.find(params[:id])
      json = category.as_json(except: [:created_at, :updated_at])
      render json: { categories: json }, status: 200
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhuma categoria encontrada' }, status: 404
    end
  end
end
