class ApplicationController < ActionController::Base
def home
end
def register
@username=params[:username]
@email=params[:email]
@password=params[:password]
@password_conformation=params[:repassword]
if @paswword==@password_conformation
user=User.create_with_password(@username,@email,@password)
if user
session[:signed_in]=true
session[:username]=user.username
redirect_to '/profile'
else
redirect_to '/log_in' 
end
end
end
def profile
 if session[:signed_in]==true
 else
  redirect_to '/log_in.html'
  end
 end 
def logout
session[:signed_in]=false
redirect_to '/profile'
 end	
def login

	@username=params[:username]
	@email=params[:email]
	@password=params[:password]
	user=User.where(username: @username).first
	if user
	valid=user.verify_password(@password)
end
if	valid
session[:signed_in]=true
session[:username]=params[:username]
params[:password]
params[:email]
redirect_to '/profile'
else
	redirect_to '/log_in.html'
end
end	
  #protect_from_forgery with: :exception
end
