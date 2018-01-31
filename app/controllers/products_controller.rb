class ProductsController < ApplicationController
  def index
    @products = Product.all
    if @products.empty?
      flash.now[:notice] = 'Não há produtos cadastrados!'
    end
  end
end
