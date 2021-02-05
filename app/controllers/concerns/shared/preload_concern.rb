module Shared::PreloadConcern extend ActiveSupport::Concern

  protected

  def add_preload(name)

    as = case name
      when /\.css(\?|$)/ then 'style'
      when /\.(svg|png|jpg|webp)(\?|$)/ then 'image'
      else return
    end

    response.headers['Link'] ||= []
    response.headers['Link'].push("<#{view_context.asset_path(name)}>; rel=preload; as=#{as}")

  end
=begin
  def set_preload_headers

    Rails.logger.info request.format
    Rails.logger.info "request.format.html?=#{request.format.html? ? 'true' : 'false'}"
    Rails.logger.info "request.xhr?=#{request.xhr? ? 'true' : 'false'}"
    Rails.logger.info "request.env['HTTP_TURBOLINKS_REFERRER'].present?=#{request.env['HTTP_TURBOLINKS_REFERRER'].present?}"

    #return if request.xhr? || request.env['HTTP_TURBOLINKS_REFERRER'].present?


    Rails.logger.info "assets size= #{preload_header_assets.size}"
    response.headers['Link'] = preload_header_assets.map do |asset|
      "<#{view_context.asset_path(asset[:name])}>; rel=preload; as=#{asset[:as]}"
    end

  end
=end
end