class AuthenticationService < ActiveInteraction::Base

  string :email
  string :password

  validates :email,
    email: true

  validates :password,
    presence: true

  def execute
    return if errors.any?
    lookup_user
    return if errors.any?
    authenticate_user
    user
  end

  private 

  attr_accessor :user

  def lookup_user
    @user = User.find_by(email: email)
    authentication_error unless user
  end


  def authenticate_user
    @user = user.authenticate(password)
    unless user
      authentication_error
      @user = nil
    end
  end

  def authentication_error
    errors.add(:password, 'is invalid')
  end

end