class TopicsController < ApplicationController
  def index
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
  end
end
