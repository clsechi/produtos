class ProductPlansController < ApplicationController
  def index
    @prices = PlanPrice.all
    flash[:notice] = 'Não existe nenhum plano cadastrado' if @prices.empty?
  end
end
