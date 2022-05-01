class UsersController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def create
    if !helpers.password_check
      redirect_to sign_up_path, alert:'Les mots de passe ne correspondent pas'
    elsif !helpers.regex_password
       redirect_to sign_up_path, alert:'Minimunm 8 caractères, au moins une lettre, une majuscule, une minuscule, un nombre et un caractère spéciale'
    else

      @user = User.new(create_user_params)
      if verify_recaptcha(model: @user) && @user.save
        @user.send_confirmation_email!
        redirect_to root_path, notice: "Please check your email for confirmation instructions."
      else
        render :new, status: :unprocessable_entity
      end
    end
   
  end

  def new
    @user = User.new
  end

  def destroy
    current_user.destroy
    reset_session
    redirect_to root_path, notice: "Your account has been deleted."
  end

  def edit
    @user = current_user
    @active_sessions = @user.active_sessions.order(created_at: :desc)
  end

  def update

    @user = current_user
    @active_sessions = @user.active_sessions.order(created_at: :desc)

    if !helpers.password_check
      redirect_to account_path, alert:'Les mots de passe ne correspondent pas'
    elsif !helpers.regex_password
       redirect_to account_path, alert:'Minimunm 8 caractères, au moins une lettre, une majuscule, une minuscule, un nombre et un caractère spéciale'
    elsif verify_recaptcha(model: @user) && @user.authenticate(params[:user][:current_password])
      if @user.update(update_user_params)
        if params[:user][:unconfirmed_email].present?
          @user.send_confirmation_email!
          redirect_to root_path, notice: "Check your email for confirmation instructions."
        else
          redirect_to root_path, notice: "Account updated."
        end
      else
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now[:error] = "Incorrect password"
      render :edit, status: :unprocessable_entity
    end
  end

  private
 
  def create_user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end

  def update_user_params
      params.require(:user).permit(:current_password, :password, :password_confirmation, :unconfirmed_email, :username)
  end

 


end
