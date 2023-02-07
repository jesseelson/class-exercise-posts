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
    
          if @post.save
            flash[:notice] = "saved successfully"
            redirect_to @post
          else
            render :new, status: :unprocessable_entity
       end
    end
    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
  
        if @post.update(post_params)
          flash[:notice] = "Updated Successfully"
          redirect_to post_url(@post)
        else
           render :edit, status: :unprocessable_entity 
        end

        def destroy
            @post = Post.find(params[:id])
            @post.destroy
            flash[:notice] = "This post was successfully destroyed." 
            render redirect_to posts_url
          end
  
      private
        def post_params
        params.require(:post).permit(:title, :body)
      end
      def set_post
        @post = Post.find(params[:id])
      end
    end
end