class UsersController < ApplicationController

    def user_params
        params.require(:user).permit(:user_id, :email, :session_token, :timestamps)
    end
    
    def show
        id = params[:id] # retrieve user ID from URI route
        @user = User.find(id) # look up user by unique ID
        # will render app/views/user/show.<extension> by default
    end
    
    def new
        # default: render 'new' template
    end
    def create
        @user = User.create!(user_params)
        flash[:notice] = "#{@user.user_id} was successfully created."
        redirect_to users_path
    end
    def edit
        @user = User.find params[:id]
    end

    def update
        @user = User.find params[:id]
        @user.update_attributes!(user_params)
        flash[:notice] = "#{@user.user_id} was successfully updated."
        redirect_to user_path(@user)
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:notice] = "User '#{@user.user_id}' deleted."
        redirect_to users_path
    end
end