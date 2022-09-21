class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @customer = Customer.find(params[:id])
    @post = @customer.posts
  end
  
  private

  def customers_params
    params.require(:customer).permit(:name,:email,:profile_image,:introduction)
  end
  
end
