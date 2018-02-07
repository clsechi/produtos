class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all
    flash.now[:notice] = 'Não há produtos cadastrados!' if @products.empty?
  end

  def new
    @product = Product.new
  end

  def create
    @category = ProductCategory.find(params[:product_category_id])
    @product = @category.products.new(product_params)
    if @product.save
      render :show
    else
      @categories = ProductCategory.all
      flash.now[:error] = 'Campos inválidos. Não pode ser nulo!'
      render :new
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :product_key,
                                    :product_category_id, :contract)
  end
end
