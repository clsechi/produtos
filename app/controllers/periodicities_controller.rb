class PeriodicitiesController < ApplicationController
  def index
    @periodicities = Periodicity.all
    if @periodicities.empty?
      flash.now[:notice] = 'Não existe nenhuma periodicidade cadastrada'
      render :index
    end
  end
end
