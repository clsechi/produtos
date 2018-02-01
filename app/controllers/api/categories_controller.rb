module Api
  class CategoriesController < ApplicationController
    def index
      @categories = ProductCategory.all
      render json: @categories
    end
  end
end
