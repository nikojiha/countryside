class Admin::FreezesController < ApplicationController
  before_action :authenticate_admin!
  def index
  end

  def create

    Customer.find(params[:customer_id]).create_customer_freeze
    redirect_to admin_root_path
  end

  def destroy
    Freeze.where(customer_id: params[:customer_id]).destroy_all
    redirect_to admin_root_path
  end
end
