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
        Post.create(post_params)
        redirect_to root_path
    end

    def show
    end
    
    def edit
    end
    
    def update
        @post.update post_params
        redirect_to @post
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy

        redirect_to root_path
    end

    private

    def set_post
        @post  = Post.find(params[:id])
    end
    def post_params
        params.require(:post).permit(:description, :image, :user_id)
    end
end
