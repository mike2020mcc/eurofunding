class AdminController < ApplicationController

  layout 'admin'
  
  http_basic_authenticate_with name: Rails.application.credentials.admin_username, password: Rails.application.credentials.admin_password, unless: Proc.new { Rails.env.development? }

end
