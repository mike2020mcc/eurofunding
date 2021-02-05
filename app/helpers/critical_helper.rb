module CriticalHelper

  def critical_css
    return unless request.get?
    @critical_css ||= begin
      if css = Critical.fetch(request.base_url, request.path)
        content_tag(:style, raw(css), type: 'text/css')
      end
    end
  end

end