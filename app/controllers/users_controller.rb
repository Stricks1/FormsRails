class UsersController < ApplicationController
    def new
      @user = User.new()
    end

    def show
      @user = User.find(params[:id])
    end

    def create
  #    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user = User.new(user_params)
        if @user.save
          redirect_to new_user_path
        else
          render :new
        end
    end

    def edit
        @user = User.find(params[:id])

    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        @user2 = User.new(user_params)
        unless @user2.valid?
          redirect_to edit_user_url(@user) 
        else
          redirect_to user_path(@user)
        end
            
    end 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
