class PostsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  helper_method :sort_column, :sort_direction

  def index
    @posts = current_user.posts.order(sort_column + " " + sort_direction)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.child_id = params[:child_id]

    if @post.save
      redirect_to child_path Child.find(params[:child_id])
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to child_path Child.find(params[:child_id])
    else
      render 'edit'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to child_path(params[:child_id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :text, :image_url, :tag, :event_date, :user_id)
    end

    def sort_column
      current_user.posts.column_names.include?(params[:sort]) ? params[:sort] : "event_date"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

end
