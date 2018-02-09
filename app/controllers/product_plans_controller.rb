class ProductPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:create]
  def index
    @plans = ProductPlan.all
    flash[:notice] = 'Não existe nenhum plano cadastrado' if @plans.empty?
  end

  def new
    @plan = ProductPlan.new
  end

  def create
    @plan = @product.product_plans.new(plan_params)
    if @plan.save
      redirect_to @plan
    else
      @products = Product.all
      flash.now[:error] = 'Campos inválidos. Não pode ser nulo!'
      render :new
    end
  end

  def show
    @plan = ProductPlan.find(params[:id])
  end

  def edit
    @plan = ProductPlan.find(params[:id])
  end

  def update
    @plan = ProductPlan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to @plan
    else
      @products = Product.all
      flash.now[:error] = 'Campos inválidos. Não pode ser nulo!'
      render :new
    end
  end

  private

  def plan_params
    params.require(:product_plan).permit(:name, :product_id, :status)
  end

  def set_product
    @product = Product.find(params[:product_id])
  rescue ActiveRecord::RecordNotFound
    invalid_product
  end

  def invalid_product
    flash[:error] = 'Produto não existe'
    redirect_to root_path
  end
end
