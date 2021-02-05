module MetaHelper

  DEFAULT_OG_IMAGE = 'og-default.png'

  def meta_tags
    og_image = content_for(:og_image) || DEFAULT_OG_IMAGE
    description = content_for(:description) || 'Providing Personalised, clear and unbiased financial advice since 1999'
    set_meta_tags(og_image, description, 'website')
  end

  def page_title
    if content_for(:title)
      title = content_for(:title)
      capture do
        concat tag.title(title)
        concat tag.meta(property: 'og:title', content: title)
      end
    else
      raise 'No title specified'
    end
  end

  def set_meta_tags(og_image, description, type)
    capture do
      concat tag.meta(property: 'og:type', content: type)
      concat tag.meta(property: 'og:url', content: url_for(only_path: false))
      concat tag.meta(property: 'og:image', content: asset_url(['og', og_image].join('/')))
      concat tag.meta(property: 'og:image:width', content: 1200)
      concat tag.meta(property: 'og:image:height', content: 630)
      concat tag.meta(property: 'og:description', content: description)
      concat tag.meta(name: 'description', content: description)
    end
  end

  def robots_block
    if content_for(:robots_block)
      capture do
        concat tag.meta(name: 'robots', content: 'nofollow,noindex')
      end
    end
  end

end


