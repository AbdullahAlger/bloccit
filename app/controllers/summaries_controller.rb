class SummariesController < ApplicationController

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.create_summary(params.require(:summary).permit(:description))

    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the summaries. Please try again."
      render :new
    end
  end
end
