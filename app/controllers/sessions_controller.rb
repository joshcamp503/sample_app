class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      # use log_in method defined in helpers
      log_in user
      redirect_to user
    else
      # Create an error message. flash.now keeps flash from persisting
      flash.now[:danger] = 'Invalid email/password combination' # Not quite r
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
