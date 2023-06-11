class ApplicationController < ActionController::Base
    include Devise::Controllers::SignInOut
    #before_action :authenticate_user_from_token!
    before_action :set_current_user
   
    private
    def set_current_user
        @current_user ||= User.find_by(token: cookies[:token]) if cookies[:token]
            cookies[:token] ||= @current_user.token if @current_user
        end
    end    



    def authenticate_user_from_token!
        authenticate_with_http_token do |token, options|
            user.email = options[:email].presence
            user = user_email &&  User.find_by_email(user_email)
            if user && Devise.secure_compare(user.authentication_token, token)
                sign_in user, store: false
            end
    end
end   
