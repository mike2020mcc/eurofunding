class SessionsController < ApplicationController

  layout false

  # POST /sessions
  def create
    @session = AuthenticationService.run(session_params)
    respond_to do |format|
      if @session.valid?
        user = @session.result
        sign_in_user(user)
        format.js { render 'create', status: :created }
      else
        format.js { render 'create', status: :unprocessable_entity }
      end
    end
  end

=begin
  # DELETE /sessions
  def destroy
    sign_out_user
    respond_to do |format|
      flash.now[:success] = 'You have logged out'
      format.js { render 'destroy', status: :ok }
    end
  end
=end

  def destroy
    sign_out_user
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end


