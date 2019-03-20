class EstimatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @estimates = Estimate.all
  end

  def new
    @estimate = Estimate.new
    @contractor = Contractor.find(params[:contractor_id])
  end

  def create
    @contractor = Contractor.find(params[:contractor_id])
    @estimate = @contractor.estimates.new(estimate_params)
    @estimate.user = current_user
    @estimate.save!
    flash[:notice] = "Orçamento solicitado com sucesso!"
    redirect_to @estimate
  end

  def show
    @estimate = Estimate.find_by(params[:id])
    authorize_estimate(@estimate)
  end

  def approve
    @estimate = Estimate.find(params[:id])
    @estimate.update(approved: true)
    redirect_to @estimate
  end

  def update
    @estimate = Estimate.find(params[:id])
    if @estimate.update(params_update)
      flash[:notice] = 'Orçamento enviado'
      redirect_to @estimate
    else
      flash[:notice] = 'Não foi possivel salvar'
      render :show
    end
  end

  private

  def params_update
    params.require(:estimate).permit(:total_hours, :material_list,
                                     :material_fee, :visit_fee,
                                                      :service_fee)
  end

  def estimate_params
    params.require(:estimate).permit(:title, :description, :location, :service_date, :day_shift, :photo)
  end

  def authorize_estimate(estimate)
    return if estimate.user == current_user
    
    redirect_to root_path
    flash[:alert] = 'Não é possível acessar este orçamento'
  end
end