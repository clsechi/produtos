class ProductCategoriesController < ApplicationController
  def index
    @categories = ProductCategory.all
    flash.now[:notice] = 'Não há categorias cadastradas!' if @categories.empty?
  end

  def new
    @category = ProductCategory.new
  end

  def create
    @category = ProductCategory.new(category_params)
    if @category.save
      render :show
    else
      flash.now[:error] = 'Campos inválidos. Não pode ser nulo!'
      render :new
    end
  end

  def show
    @category = ProductCategory.find(params[:id])
  end

  private

  def category_params
    params.require(:product_category).permit(:name, :description)
  end
end
