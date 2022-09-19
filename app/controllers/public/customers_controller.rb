class Public::CustomersController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :unsubscribe, :update, :destroy]

  def index
     @customer = Customer.all
     
     
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customers_params)
      redirect_to customer_path(customer.id)
    else
     render :edit
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @post = @customer.posts
    @following_customers = @customer.following_customer
    @follower_customers = @customer.follower_customer
  end

  def unsubscribe
     @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.destroy
      redirect_to "/"
    else
      render :unsubscribe
    end
  end

  def follows
    @customer = Customer.find(params[:id])
    @customers = @customer.following_customer
  end

  def followers
    @customer = Customer.find(params[:id])
    @customers = @customer.follower_customer
  end

  private

  def customers_params
    params.require(:customer).permit(:name,:email,:profile_image,:introduction)
  end

  def ensure_correct_customer

    unless Customer.find(params[:id]).id == current_customer.id
        redirect_to customer_path
    end
  end
end
