class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve, :reject]
  
  def index
    if admin_types.include?(current_user.type)
      @posts = Post.all.page(params[:page]).per(15)
    else
      @posts = Post.posts_by(current_user).page(params[:page]).per(15)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_case "create"
    else 
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post 
    
    if @post.update(post_params)
      redirect_case "update"
    else
      render :edit
    end
  end

  def show
   @post = Post.find(params[:id])
  end

  def destroy
    @post.delete
    redirect_case "delete"
  end
  
  def approve
    @post.approved!
    redirect_case "approve"
  end

  def reject
    @post.rejected!
    redirect_case "reject"
  end


  private
  def post_params
    params.require(:post).permit(:date, :rationale, :status, :overtime_request)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def redirect_case whichMethod
    path = @post
    case whichMethod
      when "create"
        changed = 'created'
      when "update"
        changed = 'updated'
      when "destroy"
        changed = 'deleted'
        path = posts_path 
      when "approve"
        changed = "approved"
        path = root_path
      when "reject"
        changed = "rejected"
        path = root_path
      else
        changed = 'changed'
    end
    redirect_me(path, changed)
  end

  def redirect_me path, changed
    redirect_to path, notice: "Entry #{changed} successfully"
  end
end












