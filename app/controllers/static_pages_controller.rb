class StaticPagesController < ApplicationController
  def home
  end

  def search
    @topics = Topic.search(params[:search])
    @categories = Category.all
  end
end
