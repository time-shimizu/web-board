class ResponsesController < ApplicationController
  def create
    @topic = Topic.find_by(id: params[:topic_id])
    @response = @topic.responses.build(response_params)
    if @response.save
      redirect_to @topic
    else
       flash[:danger] = "返信内容に不備があります"
      redirect_to @topic
    end
  end

  private
    def response_params
      params.require(:response).permit(:user_name, :content)
    end
end
