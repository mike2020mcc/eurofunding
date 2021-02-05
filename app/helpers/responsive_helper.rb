module ResponsiveHelper

  def hero_picture_tag(image, options = {})

    base = image.gsub(File.extname(image), '')
    options.merge!(src: image_path(base + '-poster.jpg'), 'data-srcset': image_path(base + '-md.jpg'))

  	content_tag(:picture) do

      concat(tag(:source, media: '(min-width: 1920px)', 'data-srcset': "#{image_path(base + '-xl.webp')}, #{image_path(base + '-xl@2x.webp')} 2x", type: 'image/webp')) +
      concat(tag(:source, media: '(min-width: 1200px)', 'data-srcset': "#{image_path(base + '-lg.webp')}, #{image_path(base + '-lg@2x.webp')} 2x", type: 'image/webp')) +
      concat(tag(:source, media: '(min-width: 992px)', 'data-srcset': "#{image_path(base + '-md.webp')}, #{image_path(base + '-md@2x.webp')} 2x", type: 'image/webp')) +
      concat(tag(:source, media: '(min-width: 768px)', 'data-srcset': "#{image_path(base + '-sm.webp')}, #{image_path(base + '-sm@2x.webp')} 2x", type: 'image/webp')) +
      concat(tag(:source, media: '(min-width: 576px)', 'data-srcset': "#{image_path(base + '-xs.webp')}, #{image_path(base + '-xs@2x.webp')} 2x", type: 'image/webp')) +
      concat(tag(:source, media: '(min-width: 320px)', 'data-srcset': "#{image_path(base + '-xx.webp')}, #{image_path(base + '-xx@2x.webp')} 2x", type: 'image/webp')) +

      concat(tag(:source, media: '(min-width: 1920px)', 'data-srcset': "#{image_path(base + '-xl.jpg')}, #{image_path(base + '-xl@2x.jpg')} 2x")) +
      concat(tag(:source, media: '(min-width: 1200px)', 'data-srcset': "#{image_path(base + '-lg.jpg')}, #{image_path(base + '-lg@2x.jpg')} 2x")) +
      concat(tag(:source, media: '(min-width: 992px)', 'data-srcset': "#{image_path(base + '-md.jpg')}, #{image_path(base + '-md@2x.jpg')} 2x")) +
      concat(tag(:source, media: '(min-width: 768px)', 'data-srcset': "#{image_path(base + '-sm.jpg')}, #{image_path(base + '-sm@2x.jpg')} 2x")) +
      concat(tag(:source, media: '(min-width: 576px)', 'data-srcset': "#{image_path(base + '-xs.jpg')}, #{image_path(base + '-xs@2x.jpg')} 2x")) +
      concat(tag(:source, media: '(min-width: 320px)', 'data-srcset': "#{image_path(base + '-xx.jpg')}, #{image_path(base + '-xx@2x.jpg')} 2x")) +

      concat(tag(:img, options))      
  	  	
  	end

  end

  def hero_video_tag(video, media)

    base = video.gsub(File.extname(video), '')
    media.each do |medium|
      medium[:filename] = asset_path(base + '-' + medium[:size] + '.mp4')
      medium[:poster] = asset_path(base + '-' + medium[:size] + '-poster.jpg')
    end
    content_tag(:video, nil, { preload: 'none', autoplay: true, muted: true, loop: true, playsinline: true, data: { media: media.to_json } })
  end

end