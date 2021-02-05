class ContactController < ApplicationController

  def index
    add_preload 'other/contact-woman-poster.jpg'
  end

end
