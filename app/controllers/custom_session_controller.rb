class CustomSessionController < Devise::SessionsController
  before_action :authenticate_user!
  include Devise::Controllers::SignInOut
 # skip_before_action :verify_authenticity_token respond_to :json
  def create
    user = User.find_by_email(sign_in_params[:email])
    if user && user.valid_password?(sign_in_params[:password])
      authentication_token =user.generate_authentication_token
      sign_in user, store: false
      cookies[:authentication_token] = { value: authentication_token, expires: 1.day.from_now }
      #@user.update(sign_in_count: @user.sign_in_count + 1)
      user.save # guarda el token en la base de datos
      # redireccionar a la página de inicio después del inicio de sesión exitoso
     # redirect_to "home#index", allow_other_host: true
#      current_user.update_attribute(:token, token)
      render json: { authentication_token: authentication_token }
    else
      render json: { errors:"Invalid email or password" },status: :unprocessable_entity
    end
  end  
  
  
  #def create
  #    super
  #    if user_signed_in?
        # generar token aleatorio
  #      token = SecureRandom.hex(20)
        # guardar token en la cookie
  #      cookies[:auth_token] = { value: token, expires: 1.day.from_now }
        # guardar token en la base de datos
   #     current_user.update_attribute(:auth_token, token)
  #    end
  #  end
end
