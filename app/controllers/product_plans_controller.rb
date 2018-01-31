class ProductPlansController < ApplicationController
  def index
    @plans = ProductPlan.all
    flash[:notice] = 'Não existe nenhum plano cadastrado' if @plans.empty?
  end
end
