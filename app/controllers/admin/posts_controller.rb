class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @post = Post.all
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new 
    @comments = @post.comments
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to posts_path
    else
      render :show
    end
  end
  
end
