class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(params[:id])
    @contractors = Contractor.where(category: @category)
  end
end