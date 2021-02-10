module CurrentUserHelper

  AUTHORIZATION_KEY = 'User'

  def sign_in_user(user)
    user.login!(request.remote_ip)
    cookies.permanent.encrypted[AUTHORIZATION_KEY] = { value: user.id } #, httponly: true } - otherwise cannot access in js
  end

  def signed_in_user
    unless signed_in_user?
      if request.xhr? || request.format.json?
        flash.now['error'] = 'You need to be logged in to do that!'
        head :unauthorized
        flash_headers
      else
        redirect_to root_path
      end
    end
  end

  def signed_in_user?
    !current_user.nil?
  end

  def current_user
    @current_user ||= begin
      if cookie = cookies.encrypted[AUTHORIZATION_KEY]
        User.find_by(id: cookie)
      end
    end
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out_user
    self.current_user = nil
    cookies.delete AUTHORIZATION_KEY
  end

  def current_user=(user)
    @current_user = user
  end
  
end