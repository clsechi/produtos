module Api
  class CategoriesController < ApplicationController
    def index
      categories = ProductCategory.all
      json = categories.as_json(except: [:created_at, :updated_at])
      return render json: { categories: json }, status: 200 unless categories.empty?
      render json: { message: 'Nenhuma categoria encontrada' }, status: 404
    end
    def show
      category = ProductCategory.find(params[:id])
      json = category.as_json(except: [:created_at, :updated_at])
      return render json: {categories: json}, status: 200 unless category.nil?
      render json: { message: 'Nenhuma categoria encontrada' }, status: 404
    end
  end
end
