class ServiceOrdersController < ApplicationController
  def show
    @service_order = ServiceOrder.find(params[:id])
  end
end
