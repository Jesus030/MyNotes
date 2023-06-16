class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
 
#  before_action :authenticate_user_from_token!
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    #show friend
    @user=User.find(params[:id])
    @friends=@user.friends
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

def create_friendshid
  @user=User.find(params[:id])
  current_user.send_friend_request(@user)
  redirect_to @user

end

def send_friend_request(user)
  friends.create(friend: user) unless is_friend?
  (user) || has_pending_request?(user)
end
  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_friend(friend)
 #   Friendship.create(User:self, friend:friend)
@user=User.find(params[:id])
friend=User.find(params[:friend_id])
@user.add_friend(friend)

redirect_to user_path(@user)
  end

#def remove_friend.user= User.find(params[:id])
#friend=User.find(params[:id])
#@user.remove_friend(friend)

#redirect_to user_path(@user)

#end


def proccess_friend_request
friendship= Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
if params[:accept]
  friendship.update(status: 'accepted')
elsif params[:reject]
  friendship.update(statues: 'rejected')
end
redirectback(fallback_location: root_path)

end

  def friends
    User.joins(:friendships).where("friendships.friend_id=? AND friendships.status='accepted'",self.id)
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:Username, :zip, :role, :token)
    end


    def authenticate_user_from_token!
      user_email = params[:user_email].presence
      user       = user_email && User.find_by_email(user_email)
  
      # Use Devise.secure_compare to compare the access_token
      # in the database with the access_token given in the params.
      if user && Devise.secure_compare(user.access_token, params[:access_token])
  
        # Passing store false, will not store the user in the session,
        # so an access_token is needed for every request.
        # If you want the access_token to work as a sign in token,
        # you can simply remove store: false.
        sign_in user, store: false
      end
    end

    

  end    
