class UserController < ApplicationController

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params.merge(city: City.last))
        if @user.save
          log_in(@user)
          redirect_to root_path
        else
          render :new
        end
    end

    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :age, :description, :password, :password_confirmation)
  end
  
end
