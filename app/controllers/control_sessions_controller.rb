class ControlSessionsController < ApplicationController
    def create
        user= User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            user.generate_token # genera un nuevo token
           # @user.update(sign_in_count: @user.sign_in_count + 1)
            user.save # guarda el token en la base de datos
            redirect_to root_path
          else
            flash.now.alert = "Correo o contraseña inválidos"
            render :new
          end
        end
      end
      

    end    
end
