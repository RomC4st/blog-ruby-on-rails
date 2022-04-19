module PasswordsHelper
  def regex_password
    _pass= params[:user][:password]
    if  /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.match(_pass)
      return true
    else
      return false
    end
   
  end

  def password_check 
    return params[:user][:password] == params[:user][:password_confirmation]
  end
end
