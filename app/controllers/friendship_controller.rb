class FriendshipController < ApplicationController
    def create
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        if @friendship.save
          flash[:notice] = "Added friend."
          redirect_to root_url
        else
          flash[:notice] = "Unable to add friend."
          redirect_to root_url
        end
    end  

    def destroy
        @friendship = current_user.friendships.find(params[:id])
        @friendship.destroy


        respond_to do |format|
          format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
          format.json { head :no_content }
        end        
        redirect_to current_user 
      end   

       private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:email)
    end
       
end
