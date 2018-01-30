class ProductCategoriesController < ApplicationController
  def index
    @categories = ProductCategory.all
    if @categories.empty?
      flash.now[:notice] = 'Não há categorias cadastradas!'
      render :index
    end
  end
end
