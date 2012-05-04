class SessionsController < ApplicationController

  before_filter :require_logged_out, :only => [:new, :create]

  def new
  end

  def create
    if !params[:session]
      redirect_to new_session_path
    else
    # attempts to find a user given an email and password
      user = User.authenticate(params[:session][:email], params[:session][:password_digest])
      if user
        sign_in user
        result = 'Welcome back!'
      else
        result = "Could not find account with those credentials"
      end

      respond_to do |format|
        format.js { render :json => result }
        format.html do
          flash[:notice] = result
          redirect_to user ? root_path : login_path
        end
      end
    end
  end

  def destroy
    cookies.delete(:remember_token)
    self.current_user = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
