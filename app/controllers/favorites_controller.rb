class FavoritesController < ApplicationController
  
  def create
    @favorite = current_user.favorites.create(topic_id: params[:topic_id])
    redirect_to favorites_url, notice: "#{favorite.topic.user.name}'s topic add to the Favorites."
  end
  
  def show
    # @favorite = current_user.favorites.find_by(topic_id: @topic_id)
  end
  
  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorites_url, notice: "#{favorite.topic.user.name}'s topic removed from the Favorites."
  end
end