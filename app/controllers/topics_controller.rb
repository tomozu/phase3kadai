class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  
  def index
    @topics = Topic.all
  end
  
  def new
    if params[:back]
      @topic = Topic.new(topic_params)
    else
      @topic = Topic.new
    end
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      TopicMailer.topic_mail(@topic).deliver
      redirect_to topics_path, notice:"topic posted!!"
    else
      render'new'
    end
  end
  
  def show
    @topic = Topic.find(params[:id])
    @favorite = current_user.favorites.find_by(topic_id:@topic.id)
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def confirm
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    render :new if @topic.invalid?
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to topics_path, notice:'topic updated !'
    else
      render'edit'
    end
  end
  
  def destroy
    @topic.destroy
    redirect_to topics_path, notice:'topic deleted.'
  end
  
  private
  
  def topic_params
    params.require(:topic).permit(:content, :image, :image_cache)
  end
  
  def set_topic
    @topic = Topic.find(params[:id])
  end
  
  def require_login
    unless logged_in?
      redirect_to new_session_path
    end
  end
end