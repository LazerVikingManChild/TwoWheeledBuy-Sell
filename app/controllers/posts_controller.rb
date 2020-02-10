class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to @post
            flash[:notice] = "Post created successfully"
        else
            redirect_to :posts
            flash[:alert] = "Post creation has failed."
        end
    end

    def edit
        @post = Post.find(params[:id])
        if current_user != @post.user
            sign_out current_user
            redirect_to "/"
            flash[:alert] = "Unauthorized request"
        end
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to @post
            flash[:notice] = "Post has been updated!"
        else
            redirect_back(fallback_location[root_path])
            flash[:alert] = "Post update has failed."
        end
    end

    def destroy
        post = Post.find(params[:id])
        if current_user = post.user
            post.destroy
            redirect_to "/posts"
            flash[:notice] = "Post Deleted"
        else
            redirect_back(fallback_location: root_path)
            flash[:alert] = "Not Authoried to Delete Post"
        end
    end

    private
    def post_params
        params.require(:post).permit(:price, :title, :description, :image) 
    end
end