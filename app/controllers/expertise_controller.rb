class ExpertiseController < ApplicationController

  def index
    add_preload 'hero/image/expertise-poster.jpg'
  end

  def financial
    add_preload 'other/financial-planning-poster.jpg'
  end

  def retirement
    add_preload 'other/retirement-planning-poster.jpg'
  end

  def protection
    add_preload 'other/protection-advice-poster.jpg'
  end

  def mortgage
    add_preload 'other/mortgage-advice-poster.jpg'
  end

  def will_trust
    add_preload 'other/will-and-trust-advice-poster.jpg'
  end

end
