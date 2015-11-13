class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    if !comment.save
      flash[:errors] = comment.errors.full_messages
    end
    
    redirect_to post_path(comment_params[:post_id])
  end
  
  private
    def comment_params
      params.require(:comment).permit(:comment_text, :post_id)
    end
end