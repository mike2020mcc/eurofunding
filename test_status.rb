require 'uri'
require 'net/http'
require 'base64'
require 'json'

url = URI("https://api.shuftipro.com/status")

CLIENT_ID   = "b8UdLdiM9FLX1jqhpEPYTALu9GPddCXc6k4cV5mOxHikMwAlu81612327008"
SECRET_KEY  = "$2y$10$FP1zShMtO9Uxg83UjAJsVudFvpYwhUN5J2jyYJNI8mfH5Jey5a6p6"
# if access token
# ACCESS_TOKEN = "YOUR-ACCESS-TOKEN"

post_data = { 
     reference: "12345678910" 
}

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
request = Net::HTTP::Post.new(url)

header_auth = Base64.strict_encode64("#{CLIENT_ID}:#{SECRET_KEY}")
# if Access Token
# header_auth = ACCESS_TOKEN
request["Content-Type"]  = "application/json"
request["Authorization"] = "Basic #{header_auth}"   # replace "Basic" with "Bearer" in case of access token
request.body             = post_data.to_json
