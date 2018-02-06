module Api
  class CategoriesController < ApplicationController
    def index
      @categories = ProductCategory.all
      @categories = @categories.as_json(except: [:created_at, :updated_at])
      return render json: { categories: @categories }, status: 200 unless @categories.empty?
      render json: { message: 'Nenhuma categoria encontrada' }, status: 404
    end
    def show
      @category = ProductCategory.find(params[:id])
      @category = @category.as_json(except: [:created_at, :updated_at])
      return render json: {categories: @category}, status: 200 unless @category.nil?
      render json: { message: 'Nenhuma categoria encontrada' }, status: 404
    end
  end
end
