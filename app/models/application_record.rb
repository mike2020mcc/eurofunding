class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  # see: app/views/one_signal/works.js.erb
  # see: app/helpers/snippet_helper.rb

  after_commit do
    CacheBuster.invalidate
  end

end
