class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    authorize favorite

    if favorite.save
      flash[:notice] = "Post was favorited."
    else
      flash[:error] = "An error occurred when favoriting the post. Please try again."
    end
    redirect_to [post.topic, post]
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = Favorite.find(params[:id])

    authorize favorite

    if favorite.destroy
      flash[:notice] = "Post was unfavorited."
    else
      flash[:error] = "There was an error unfavoriting the post."
    end
    redirect_to [post.topic, post]
  end
end
