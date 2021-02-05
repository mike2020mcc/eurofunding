class ShuftiService < ActiveInteraction::Base

  string :reference, default: nil
  string :email, default: nil
  string :country, default: nil

  validates :reference,
    presence: true

  validates :email,
    presence: true

  validates :country,
    presence: true


  def execute
    ActiveSupport::HashWithIndifferentAccess.new(onsite)
  end

  private

  def onsite
    url = URI(Figaro.env.shufti_endpoint)
    verification_request = { 
      reference: reference,
      callback_url: Figaro.env.shufti_callback_url,
      email: email,
      country: country,
      language: "EN",
      redirect_url: Figaro.env.shufti_redirect_url,
      verification_mode:  "any"
    }
    verification_request["face"] = {
      proof: ""
    }
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url)
    header_auth = Base64.strict_encode64("#{Figaro.env.shufti_client_id}:#{Figaro.env.shufti_secret_key}")
    request["Content-Type"]  = "application/json"
    request["Authorization"] = "Basic #{header_auth}"
    request.body = verification_request.to_json
    response = http.request(request)
    response.read_body
    JSON.parse(response.read_body)
  end


end