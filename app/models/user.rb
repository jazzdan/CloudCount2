require 'digest'

class User < ActiveRecord::Base

  before_save :encrypt_password

  # Enumerates admin roles
  ROLE_USER             = 1
  ROLE_ADMIN            = 2

  ADMIN_RANKING = {
    ROLE_USER: 1,
    ROLE_ADMIN: 2
  }

  def is_admin?
    self.role == User::ROLE_ADMIN
  end

  # creates a ranking of levels and determines whether the user falls at least at the specified level
  def is_at_least_level?(level)
    return false if !ADMIN_RANKING[level] or !ADMIN_RANKING[self.role]
    return ADMIN_RANKING[self.role] >= ADMIN_RANKING[level]
  end

  # returns a user's first name and last name together
  def display_name
    display = [first_name, last_name].join(' ').strip
    display.blank? ? email : display
  end

  # attempts to validate an email and password with a user
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  # returns a user from the id and salt stored in the cookie
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def self.from_remember_token (token)
    User.authenticate_with_salt(*token)
  end

  # Verifies a given password is equivalent to a user's password
  def has_password? (submitted_password)
    password_digest == encrypt(submitted_password)
  end

  private

  # encrypts a new user's password
  def encrypt_password
    if new_record?
      self.salt = make_salt
      self.password_digest = encrypt(password_digest)
    end
  end

  # encrypts a given string with the user's salt
  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  # returns a new salt based on the current time and the user's submitted password
  def make_salt
    secure_hash("#{Time.now.utc}--#{password_digest}")
  end

  # encrypts a string with SHA2 encryption
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end
