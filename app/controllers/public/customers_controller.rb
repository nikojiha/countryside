class Public::CustomersController < ApplicationController
  
  def index
     @customer = Customer.page(params[:page]).per(3).reverse_order
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
  customer = Customer.find(params[:id])
  customer.update(post_params)
  redirect_to customer_path(customer.id)
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
  end
  
  def destroy
  end

  def follows
    customer = Customer.find(params[:id])
    @customers = customer.following_customer.page(params[:page]).per(3).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end
  
  private
  
  def customers_params
    params.require(:customer).permit(:name,:email,:profile_image)
  end
end
