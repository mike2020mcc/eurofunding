class AccountController < ApplicationController

  before_action :signed_in_user

  def index
    @nav_solid = true
  end

end
