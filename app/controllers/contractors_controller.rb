class ContractorsController < ApplicationController

    def show
      @contractor = Contractor.find(params[:id])
      @average_grade = Contractor.update_average(@contractor)
    end

    def edit
      @contractor = current_contractor
      @categories = Category.all
      @contractor.profile ||= @contractor.build_profile
    end

    def update
      @contractor = current_contractor
      if @contractor.update(contractor_params)
        @contractor.profile.sub_categories = sub_categories_params
        redirect_to @contractor
      else
        @categories = Category.all
        flash[:alert] = 'Não foi possível atualizar o perfil'
        render :edit
      end
    end

    private

    def contractor_params
      params.require(:contractor).permit(:name, :category_id, :cpf, profile_attributes: [:id, :city])
    end

    def sub_categories_params
      SubCategory.where(id: params[:contractor][:profile_attributes][:sub_category_ids])
    end

end
