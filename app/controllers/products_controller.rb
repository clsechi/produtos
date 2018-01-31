class ProductsController < ApplicationController
  def index
    @products = Product.all
    flash.now[:notice] = 'Não há produtos cadastrados!' if @products.empty?
  end
end
