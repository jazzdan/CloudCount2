class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :setup_request

  # set some sweet globals
  def setup_request

    @remote_ip = request.remote_ip
    @user_agent = request.user_agent
    @current_uri = request.url

    @current_user = current_user
    @controller = controller_name
    @action = action_name
  end


  private 
  def current_user
    
  end

  # returns true if a user is logged in
  def is_logged?
    !!current_user
  end
  
  # returns the current user either as an instance variable or attempts to pull a user from the database using the cookie
  def current_user
    @current_user ||= User.from_remember_token(remember_token)
  end
  
  def is_current_user?(user)
    @current_user == user
  end
end
