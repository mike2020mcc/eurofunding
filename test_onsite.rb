require 'uri'
require 'net/http'
require 'base64'
require 'json'
require 'open-uri'
require 'securerandom'
url = URI("https://api.shuftipro.com/")
CLIENT_ID   = "b8UdLdiM9FLX1jqhpEPYTALu9GPddCXc6k4cV5mOxHikMwAlu81612327008"
SECRET_KEY  = "$2y$10$FP1zShMtO9Uxg83UjAJsVudFvpYwhUN5J2jyYJNI8mfH5Jey5a6p6"
verification_request = { 
    #reference:          "Ref-"+ (0...8).map { (65 + rand(26)).chr }.join,
    reference: SecureRandom.uuid,
    callback_url:       "https://cd4485d6bf45.ngrok.io/callback",
    email:              "johndoe@example.com",
    country:            "GB",
    language:           "EN",
    redirect_url:       "http://www.example.com",
    verification_mode:  "any"
}
verification_request["face"] = {
    proof: ""
}
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
request = Net::HTTP::Post.new(url)
header_auth = Base64.strict_encode64("#{CLIENT_ID}:#{SECRET_KEY}")
request["Content-Type"]  = "application/json"
request["Authorization"] = "Basic #{header_auth}"
request.body = verification_request.to_json
response = http.request(request)
puts response.read_body