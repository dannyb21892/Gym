class SessionsController < ApplicationController
  def create #login
    user = User.find_by_username(params[:username])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      # redirect_to '/'
      redirect_to user
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def create_from_signup #autologin after signup
    user = User.find_by_username(params[:username])
    # If the user exists AND the password entered is correct.
    if user.authenticate(params[:password])
    # Save the user id inside the browser cookie. This is how we keep the user
    # logged in when they navigate around our website.
    session[:user_id] = user.id
    # redirect_to '/'
    redirect_to user
  else
    redirect_to '/login'
  end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def new
  end


end#end
