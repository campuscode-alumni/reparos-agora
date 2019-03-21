class EstimatesController < ApplicationController
  before_action :authenticate_all
  before_action :authenticate_user!, only: %i[new approve create]
  before_action :authenticate_contractor!, only: [:update]

  def index
    @estimates = current_contractor_or_user.estimates
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
    EstimatesMailer.notify_approved(@estimate.id, @estimate.contractor.email)
    @estimate.update(approved: true)
    flash[:notice] =  'Prestador de serviço será notificado'
    redirect_to @estimate
  end

  def update
    @estimate = Estimate.find(params[:id])
    if @estimate.update(params_update)
      flash[:notice] = 'Orçamento enviado'
      redirect_to @estimate
    else
      flash[:alert] = "Não foi possivel salvar"
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
    return if estimate.user == current_user || estimate.contractor.eql?(current_contractor)
    redirect_to root_path
    flash[:alert] = 'Não é possível acessar este orçamento'
  end

  def authenticate_all
    unless user_signed_in? || contractor_signed_in?
      redirect_to root_path
    end
  end
end