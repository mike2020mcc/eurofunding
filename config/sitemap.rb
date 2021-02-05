require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://www.financialsolutions.asia'
SitemapGenerator::Sitemap.include_root = false
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
#SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.create do

  add '/', changefreq: 'monthly', priority: 0.9
  add '/about', changefreq: 'monthly', priority: 0.5
  add '/about/team', changefreq: 'monthly', priority: 0.5
  add '/expertise', changefreq: 'monthly', priority: 0.5
  add '/expertise/financial-planning', changefreq: 'monthly', priority: 0.5
  add '/expertise/retirement-planning', changefreq: 'monthly', priority: 0.5
  add '/expertise/protection-advice', changefreq: 'monthly', priority: 0.5
  add '/expertise/mortgage-advice', changefreq: 'monthly', priority: 0.5
  add '/expertise/will-and-trust-advice', changefreq: 'monthly', priority: 0.5
  add '/contact', changefreq: 'monthly', priority: 0.5

end

