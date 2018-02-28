class PeriodicitiesController < ApplicationController
  before_action :authenticate_user!
  def index
    @periodicities = Periodicity.all
    return unless @periodicities.empty?
    flash.now[:notice] = 'Não existe nenhuma periodicidade cadastrada'
    render :index
  end

  def new
    @periodicity = Periodicity.new
  end

  def create
    @periodicity = Periodicity.new(periodicity_params)
    if @periodicity.save
      redirect_to periodicities_path
    else
      render :new
    end
  end

  private

  def periodicity_params
    params.require(:periodicity).permit(:name, :period)
  end
end
