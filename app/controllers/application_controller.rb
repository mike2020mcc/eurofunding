class ApplicationController < ActionController::Base

  include Shared::PreloadConcern
  include CurrentUserHelper

  before_action :show_cache
  after_action :set_client_hints
  
  after_action Proc.new{ add_preload('logo.svg') }

  protected

  def show_cache
    # Added test on 20190715
    Rails.logger.info "Save-Data: #{request.headers['Save-Data']}"
    Rails.logger.info "Downlink: #{request.headers['Downlink']}"
    Rails.logger.info "Viewport-Width: #{request.headers['Viewport-Width']}"
    Rails.logger.info Rails.cache.instance_variable_get(:@data).keys
  end

  def set_client_hints
    response.set_header('Accept-CH', 'Viewport-Width, Downlink')
    response.set_header('Accept-CH-Lifetime', 600)
  end

end
