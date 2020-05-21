class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    if current_user
        @posts = Post.paginate(page: params[:page], per_page: 15).order('created_at DESC')
    else
        redirect_to new_user_session_path
    end  
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path
    else
      @posts = Post.paginate(page: params[:page], per_page: 15).order('created_at DESC')
      render :index
    end
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    if @post.id?
      @post.destroy
      redirect_to root_path, success: "Post deleted"
    else
      redirect_to root_path, error: "Post doesn't exist"
    end
  end

  private

  def set_post
    @post  = Post.find_by(id: params[:id]) 
    if @post.nil?
      redirect_to root_path, error: "Post doesn't exist"
    end
  end
  def post_params
    params.require(:post).permit(:description, :image, :user_id)
  end
end
