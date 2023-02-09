class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id #para secion automatica
            return redirect_to root_url, notice: 'Logged In!'  # esto funciona para rails 7
        else
            render :new, status: :unprocessable_entity #esto es necesario para rails 7 en rails 6 no es necesario
        end
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
