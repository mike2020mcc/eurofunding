class UsersController < ApplicationController


  # POST /users

  def create
    @user = User.new(user_params.merge!(login_ip: request.remote_ip, login_country: CountriesService.lookup(request.remote_ip), login_at: Time.current))
    respond_to do |format|
      if @user.valid?
        reference = SecureRandom.uuid
        run = ShuftiService.run(reference: reference, email: @user.email, country: @user.country)
        if run.valid?
          @user.shufti_reference = run.result[:reference]
          @user.shufti_event = run.result[:event]
          @user.shufti_verification_url = run.result[:verification_url]
          @user.save!
          sign_in_user(@user)
          format.js { render 'create', status: :created }
        else 
          format.js { render 'shufti_failure', status: :unprocessable_entity }
        end

      else
        format.js { render 'create', status: :unprocessable_entity }
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:remittances, :banking, :given_name, :family_name, :email, :country, :mobile, :password, :password_confirmation)
  end

end