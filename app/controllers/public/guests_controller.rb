class Public::GuestsController < ApplicationController
  
   def new_guest
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      # customer.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in customer
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
   end
  
end
