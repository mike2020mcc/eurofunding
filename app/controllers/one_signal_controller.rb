class OneSignalController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  before_action :no_cache
  
  def worker
  end

  private

  def no_cache
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end

end


