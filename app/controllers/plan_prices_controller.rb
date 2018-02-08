class PlanPricesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plan, only: [:create]
  def index
    @prices = PlanPrice.all
    flash[:notice] = 'Não existe nenhum plano cadastrado' if @prices.empty?
  end

  def new
    @price = PlanPrice.new
    @periodicities = Periodicity.all
  end

  def create
    @price = @plan.plan_prices.new(price_params)
    if @price.save
      redirect_to @price
    else
      @periodicities = Periodicity.all
      flash.now[:error] = 'Campos inválidos. Não pode ser nulo!'
      render :new
    end
  end

  def show
    @price = PlanPrice.find(params[:id])
  end

  private

  def price_params
    params.require(:plan_price).permit(:value, :periodicity_id,
                                       :product_plan_id)
  end

  def set_plan
    @plan = ProductPlan.find(params[:product_plan_id])
  rescue ActiveRecord::RecordNotFound
    invalid_plan
  end

  def invalid_plan
    flash[:error] = 'Plano não existe'
    redirect_to root_path
  end
end
