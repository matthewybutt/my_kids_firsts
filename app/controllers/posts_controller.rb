class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def patch
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :text, :image_url, :tag, :event_date)
    end

end
