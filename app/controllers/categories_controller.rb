class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
  
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params.require(:category).permit(:name))
      redirect_to @category
    else
      flash[:alert] = 'É necessário preencher todos os campos!'
      render :edit
    end
  end
end