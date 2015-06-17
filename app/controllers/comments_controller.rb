class CommentsController < ApplicationController

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comment
  end

  def create
    topic = Topic.find(params[:topic_id])
    post = Post.find(params[:post_id])
    comment = current_user.comments.build(comment_params)

    # @comment = Comment.new
    # @comment.user = current_user
    # @comment.body = comment_params[:body]

    comment.post = post

    authorize comment

    if comment.save
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end
    # redirect_to [topic, post]
    redirect_to topic_post_path(topic, post)
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]

    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
