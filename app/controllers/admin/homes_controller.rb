class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
     @customers = Customer.all
  end
  
  private

  def homes_params
    params.require(:home).permit(:profile_image)
  end
  
end
