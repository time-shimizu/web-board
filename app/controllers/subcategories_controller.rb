class SubcategoriesController < ApplicationController
  def show
    @subcategory = Subcategory.find(params[:id])
    @topics = @subcategory.topics
    @categories = Category.all
  end
end
