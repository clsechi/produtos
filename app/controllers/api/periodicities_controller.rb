module Api
  class PeriodicitiesController < ApplicationController
    def index
      periodicities = Periodicity.all
      return render json: periodicities unless periodicities.empty?
      render json: { message: 'Nenhuma periodicidade encontrada' }, status: 404
    end
  end
end
