class CountriesService 

  DB = MaxMindDB.new(Rails.root.join('db', 'GeoLite2-City.mmdb'))
  DB.local_ip_alias = '119.92.244.146'

  def self.lookup(ip)
    if entry = DB.lookup(ip)
      entry.country.iso_code
    else
      'US'
    end
  end

end