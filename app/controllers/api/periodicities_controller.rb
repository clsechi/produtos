module Api
  class PeriodicitiesController < ApplicationController
    def index
      periodicities = Periodicity.all
      if periodicities.empty?
        render json: { message: 'Nenhuma periodicidade encontrada',
                       status: :ok }
      else
        render json: periodicities
      end
    end
  end
end
