class AboutController < ApplicationController

  def index
    add_preload 'hero/image/about-poster.jpg'
  end

  def team
    add_preload 'hero/image/about-team-poster.jpg'
  end

end
