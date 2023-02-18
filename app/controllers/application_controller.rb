class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :encrypted_password, :name])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
<<<<<<< HEAD
      username == 'abest' && password == '7880'
=======
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
>>>>>>> 2e94406f4bf121437d7c427e129828a1736318f7
    end
  end


end
