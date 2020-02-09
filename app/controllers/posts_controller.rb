class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        # @post.user_id = current_user.id
        if @post.save
            redirect_to @post
            flash[:notice] = "Post created successfully"
        else
            redirect_to :posts
            flash[:alert] = "Post creation has failed."
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private
    def post_params
        params.require(:post).permit(:seller_id, :price, :title, :description, :image) 
    end
end