#require 'critical/config'
#require 'critical/loader'

module Critical

  NAMESPACE = 'critical'.freeze

  def self.fetch(host, path)
    if Rails.cache.exist?(path, namespace: NAMESPACE)
      Rails.cache.read(path, namespace: NAMESPACE)
    else
      css = '/* running */'
      Rails.cache.write(path, css, namespace: NAMESPACE)
      Runner.perform_async(host, path)
      css
    end
  end

  def self.fetcher
    @fetcher ||= Fetcher.new(Config.new(config_loader.config))
  end

  def self.config_loader
    @config_loader ||= Critical::ConfigLoader.new
  end

end