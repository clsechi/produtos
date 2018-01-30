class PeriodicitiesController < ApplicationController
  def index
    @periodicities = Periodicity.all
  end
end
