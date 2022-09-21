class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, except: [:index,:show]

  def new 
     @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer = current_customer
    if @post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @post = Post.all
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new 
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
    if @post.customer == current_customer
      render :edit
    else
      redirect_to customer_path(@post.customer)
    end
  end

  def update
    post = Post.find(params[:id])
    if params[:post][:image_ids]
      params[:post][:image_ids].each do |image_id|
        image = post.images.find(image_id)
        image.purge
      end
    end
    if post.update(post_params)
      flash[:success] = "編集しました"
      redirect_to posts_url
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.customer == current_customer
      if post.destroy
        redirect_to posts_path
      else
        render :show
      end
    else
      redirect_to customer_path(post.customer)
    end
  end

  private

  def post_params
    params.require(:post).permit(:location, :post_comment, :tag_id, :star,images: [])
  end
  
end
