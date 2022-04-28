# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]
  before_action :authenticate_user!, only: [:destroy]

  def create
    @user = User.authenticate_by(email: params[:user][:email].downcase, password: params[:user][:password])
    if @user
      if @user.unconfirmed?
        redirect_to new_confirmation_path, alert: "Incorrect email or password."
      else
        if verify_recaptcha(model: @user) && @user.save
          after_login_path = session[:user_return_to] || root_path
          active_session = login @user
          remember(active_session) if params[:user][:remember_me] == "1"
          redirect_to article_index_path, notice: "Logged in"
         #redirect_to after_login_path, notice: "Signed in."
        else
          render :new, status: :unprocessable_entity       
        end
      end
    else
      flash.now[:alert] = "Incorrect email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def omniauth
    @user = User.from_omniauth(auth)
    if(!@user)
      redirect_to root_path, notice: "Unknow user"
    else
      @user.save
      after_login_path = session[:user_return_to] || root_path
      active_session = login @user
      redirect_to article_index_path
    end
  end

  def destroy
    forget_active_session
   #logout
    redirect_to root_path, notice: "Signed out."
  end

  def new
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end