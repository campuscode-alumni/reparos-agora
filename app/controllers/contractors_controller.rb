class ContractorsController < ApplicationController

    def show
      @contractor = Contractor.find(params[:id])
    end

    def edit
      @contractor = Contractor.find(params[:id])
      @categories = Category.all
    end

    def update
      @contractor = Contractor.find(params[:id])
      if @contractor.update(contractor_params)
        redirect_to @contractor
      else
        @categories = Category.all
        flash[:alert] = 'Não foi possível atualizar o perfil'
        render :edit
      end
    end

    private 

    def contractor_params
      params.require(:contractor).permit(:name, :category_id)
    end

end
