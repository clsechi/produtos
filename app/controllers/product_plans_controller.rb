class ProductPlansController < ApplicationController
  def index
    @plans = ProductPlan.all
    flash[:notice] = 'Não existe nenhum plano cadastrado' if @plans.empty?
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
    params.require(:product_plan).permit(:name, :product_id)
  end
end
