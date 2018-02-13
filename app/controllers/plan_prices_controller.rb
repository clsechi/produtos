class PlanPricesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plan, only: [:create]

  def new
    @price = PlanPrice.new
    @periodicities = Periodicity.all
  end

  def create
    new_price_params = price_params[:value].tr(',', '.')
    @price = @plan.plan_prices.new(price_params)
    @price.value = new_price_params
    if @price.save
      redirect_to @price
    else
      @periodicities = Periodicity.all
      render :new
    end
  end

  def show
    @price = PlanPrice.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Não existe nenhum plano'
    redirect_to root_path
  end

  private

  def price_params
    params.require(:plan_price).permit(:value, :periodicity_id,
                                       :product_plan_id)
  end

  def set_plan
    @plan = ProductPlan.find(params[:product_plan_id])
  end
end
