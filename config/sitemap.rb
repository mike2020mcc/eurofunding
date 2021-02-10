require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://www.eurofunding.co.uk'
SitemapGenerator::Sitemap.include_root = false
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
#SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.create do

  add '/', changefreq: 'monthly', priority: 0.9
  add '/about', changefreq: 'monthly', priority: 0.5
  add '/services/banking', changefreq: 'monthly', priority: 0.5
  add '/services/remittances', changefreq: 'monthly', priority: 0.5

end

