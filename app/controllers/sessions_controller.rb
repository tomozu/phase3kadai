class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:danger] = 'The login attempt failed.'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged off.'
    redirect_to new_session_path
  end
  
  private
  
  def session_params
    params.require(:session).permit(:name, :email, :password,
                                      :password_confirmation)
  end                                    
end