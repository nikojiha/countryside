class Public::RelationshipsController < ApplicationController
  
def create
  current_customer.follow(params[:user_id])
  redirect_to request.referer
end

def destroy
  current_customer.unfollow(params[:user_id])
  redirect_to request.referer
end

  
end
