class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @categories = Category.all
  end

  def show
    @topic = Topic.find(params[:id])
    @subcategories = @topic.subcategories
    @responses = @topic.responses
    @response = Response.new
  end

  def new
    @topic = Topic.new
    @topic.subcategories.build
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic
    else
      render 'new'
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:user_name, :title, :content, {:subcategory_ids => []})
  end
end
