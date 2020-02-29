class StaticPagesController < ApplicationController
  def home
  end

  def search
    @topics = Topic.search(params[:search]).page(params[:page]).per(5)
    @categories = Category.all
  end
end
