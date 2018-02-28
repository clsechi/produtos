class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = ProductCategory.count
    @products = Product.count
    @plans = ProductPlan.count
  end
end
