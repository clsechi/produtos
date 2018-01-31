class ProductPlansController < ApplicationController
  def index
    @plans = ProductPlan.all
  end
end
