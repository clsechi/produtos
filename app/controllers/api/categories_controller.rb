module Api
  class CategoriesController < ApplicationController
    def index
      @categories = ProductCategory.all
      return render json: @categories, status: 200 unless @categories.empty?
      render json: { message: 'Nenhuma categoria encontrada', status: 404 }
    end
  end
end
