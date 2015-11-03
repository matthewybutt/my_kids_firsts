class ChildrenController < ApplicationController

  def index
    @child = current_user.children.first
    @posts = Post.where(child_id: @child)
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(post_params)
    @child.user_id = current_user.id
    if @child.save
      redirect_to children_path
    else
      render 'new'
    end
  end

  private
    def post_params
      params.require(:child).permit(:name, :birthday, :user_id)
    end

end
