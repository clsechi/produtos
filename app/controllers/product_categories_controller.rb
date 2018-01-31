class ProductCategoriesController < ApplicationController
  def index
    @categories = ProductCategory.all
    flash.now[:notice] = 'Não há categorias cadastradas!' if @categories.empty?
  end
end
