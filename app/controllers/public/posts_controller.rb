class Public::PostsController < ApplicationController

  def new
     @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer = current_customer
    @post.save!
    redirect_to posts_path
  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if params[:post][:image_ids]
      params[:post][:image_ids].each do |image_id|
        image = post.images.find(image_id)
        image.purge
      end
    end
    if post.update_attributes(post_params)
      flash[:success] = "編集しました"
      redirect_to posts_url
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:location, :post_comment, :tag_id, :star,images: [])
  end
end
