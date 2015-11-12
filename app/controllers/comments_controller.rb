class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    @comment.save
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comments_params
    params.require(:comment).permit(:title, :text)
  end
end
