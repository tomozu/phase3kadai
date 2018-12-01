class FavoritesController < ApplicationController
  
  def create
    @favorite = current_user.favorites.create(topic_id: params[:topic_id])
    redirect_to topic_path(params[:topic_id]), notice: "#{@favorite.topic.user.name}'s topic add to the Favorites."
  end
  
  def index
    @topics = current_user.favorites.map(&:topic)
  end
  
  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to topic_path(params[:topic_id]), notice: "#{@favorite.topic.user.name}'s topic removed from the Favorites."
  end
end