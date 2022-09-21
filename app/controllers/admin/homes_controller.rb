class Admin::HomesController < ApplicationController
  def top
     @customers = Customer.all
  end
  
  private

  def homes_params
    params.require(:home).permit(:profile_image)
  end
  
end
