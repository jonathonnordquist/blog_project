class PostsController < ApplicationController
  def index
  end
  
  def user_posts
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      flash.now[:errors] = @post.errors.full_messages
      render new_post_path
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
