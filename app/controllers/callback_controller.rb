class CallbackController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def index
    if user = User.find_by(shufti_reference: params[:reference])
      user.shufti_event = params[:event]
      user.shufti_response = params.to_json
      user.save!
    end
    head :ok
  end


end


