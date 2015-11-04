class ChildrenController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @child = current_user.children
  end

  def show
    @child = Child.find(params[:id])
    @posts = @child.posts
  end

  def new
    @child = Child.new
  end

  def edit
    @child = Child.find(params[:id])
  end

  def create
    @child = Child.new(child_params)
    @child.user_id = current_user.id
    if @child.save
      redirect_to account_path
    else
      render 'new'
    end
  end

  def update
    @child = Child.find(params[:id])

    if @child.update(child_params)
      redirect_to account_path
    else
      render 'edit'
    end
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy

    redirect_to account_path
  end

  private
    def child_params
      params.require(:child).permit(:name, :birthday, :user_id)
    end

end