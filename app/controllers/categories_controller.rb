class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(params[:id])
    @contractors = Contractor.where(category: @category)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:saved] = 'Categoria cadastrada com sucesso.'
      redirect_to @category
    else
      render 'new'
    end
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

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
