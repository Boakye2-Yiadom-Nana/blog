class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
     @post = Post.find(params[:id])
  end
  
  def new
    @post =Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post created successfully!'
    else
      render :new
    end
  
  end
  
  def edit
     @post = Post.find(params[:id])
  end  
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated successfully!'
    else
      render :edit
    end
  end  

  def destroy
    @post =Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post deleted'

  end  

  private
  
  def post_params
  params.require(:post).permit(:title, :content, :published)
end
  
end
