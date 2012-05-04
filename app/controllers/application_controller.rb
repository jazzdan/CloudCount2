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

  # returns the current user either as an instance variable or attempts to pull a user from the database using the cookie
  def current_user
    @current_user ||= User.from_remember_token(remember_token)
  end
  
  def is_current_user?(user)
    @current_user == user
  end

  # returns true if a user is logged in
  def is_logged?
    !!current_user
  end

# use in a before_filter to require that a user is logged in to access the specified actions
 def require_login
   redirect_to(login_path, notice: "Please login") unless is_logged?
 end

 # use in a before_filter to require that a user is not logged in to access the specified actions
 def require_logged_out
   deny_access unless !is_logged?
 end

 def require_privileged_status
   deny_access unless is_logged? and current_user.is_privileged?
 end

 def require_admin
   deny_access unless is_logged? and current_user.is_admin?
 end

 # redirects the user to the root path
 def deny_access(path = nil)
   redirect_to path ? path : root_path
 end

 # is a given user the currently logged in user?
 def current_user? (user)
   user == current_user
 end

 # Sets a cookie with the provided user's id and salt.
 # Sets the current logged-in user instance variable to the given user
 def sign_in(user)
   cookies.permanent.signed[:remember_token] = [user.id, user.salt]
   self.current_user = user
 end



  private 
  # set the current user
  def current_user=(user)
    @current_user = user
  end

  # returns a tuple from either from the cookies, if one exists, representing a user's id, or a pair of nils
  def remember_token
    cookies.signed[:remember_token] || [nil, nil]
  end
end
