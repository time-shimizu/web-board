class SubcategoriesController < ApplicationController
  def show
    @subcategory = Subcategory.find(params[:id])
    @topics = @subcategory.topics.page(params[:page]).per(5)
    @categories = Category.all
    render 'topics/index'
  end
end
