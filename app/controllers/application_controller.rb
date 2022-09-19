class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top]
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin then
    admin_root_path
    when Customer then
    customer_path(resource)
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin then
    new_admin_session_path
    when :customer then
    root_path
    end
  end

protected
  # 編集画面から画像を受け取れるよう設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i(profile_image))
  end
end
