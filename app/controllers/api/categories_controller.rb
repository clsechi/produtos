module Api
  class CategoriesController < ApplicationController
    def index
      @categories = ProductCategory.all
      if @categories.empty?
        render json: { message: 'Nenhuma categoria encontrada', status: :ok }
      else
        render json: @categories, status: :ok
      end
    end
  end
end
