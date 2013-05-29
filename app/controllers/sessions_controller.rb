class SessionsController < ApplicationController
def new
end 

def create
	user = User.find_by_email(params[:sessions][:email].downcase)
	if user && user.authenticate(params[:sessions][:password])
		#
	else
		flash[:error] = 'Invalid Email/Password combination' 
		render 'new'
	end
end

def destroy
end

end
