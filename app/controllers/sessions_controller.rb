class SessionsController < ApplicationController

	def new
	
	end

	def create
    user = User.where(:name => params[:session][:name].downcase).first
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

	def destroy

	end


end
