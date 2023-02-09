class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])#User.find_by_email // ya no se filtra de esta forma
    puts ("==============================")
    puts ("el usuario :"+user.to_s)
    puts ("==============================")
    if user and user.authenticate(params[:password])
      session[:user_id]= user.id
      redirect_to root_url, notice: 'Logged In'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to root_url, notice: 'logged out!'
  end
end
