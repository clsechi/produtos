class ProductPlansController < ApplicationController
  def index
    @prices = PlanPrice.all
    flash[:notice] = 'Não existe nenhum plano cadastrado' if @prices.empty?
  end

  def new
    @plan = ProductPlan.new
    @products = Product.all
  end

  def create
    @plan = ProductPlan.new(plan_params)
    if @plan.save
      render :show
    else
      @products = Product.all
      flash.now[:error] = 'Campos inválidos. Não pode ser nulo!'
      render :new
    end
  end

  def show
    @plan = ProductPlan.find(params[:id])
  end

  private

  def plan_params
    params.require(:product_plan).permit(:duration, :product_id)
  end
end
