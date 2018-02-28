class ProductCategoriesController < ApplicationController
  before_action :authenticate_user!

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
      redirect_to @category
    else
      render :new
    end
  end

  def show
    @category = ProductCategory.find(params[:id])
  end

  def edit
    @category = ProductCategory.find(params[:id])
  end

  def update
    @category = ProductCategory.find(params[:id])
    if @category.update(category_params)
      redirect_to @category
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:product_category).permit(:name, :description)
  end
end
