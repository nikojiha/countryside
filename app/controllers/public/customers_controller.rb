class Public::CustomersController < ApplicationController
  
  def index
     @customer = Customer.all
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
    @following_customers = @customer.following_customer
    @follower_customers = @customer.follower_customer
  end
  
  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to "/"
  end

  def follows
    customer = Customer.find(params[:id])
    @customers = customer.following_customer
  end

  def followers
    customer = Customer.find(params[:id])
    @customers = customer.follower_customer
  end
  
  private
  
  def customers_params
    params.require(:customer).permit(:name,:email,:profile_image)
  end
end
