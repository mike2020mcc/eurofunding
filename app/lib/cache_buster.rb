class CacheBuster

  CACHE_KEY = 'cache_buster'

  def self.timestamp
    Rails.cache.fetch(CACHE_KEY) { Time.now.to_i }
  end

  def self.invalidate
    Rails.cache.delete(CACHE_KEY)
    Rails.cache.delete_matched('views/*')
    Rails.cache.delete_matched('sql/*')
  end

end