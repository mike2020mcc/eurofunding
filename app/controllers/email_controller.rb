class EmailController < ApplicationController

  skip_forgery_protection

  layout false

  def deliver
    #Rails.logger.info "token=#{request.headers['X-CSRF-Token']}"
    form = EmailForm.run(form_params)
    respond_to do |format|
      if verify_recaptcha(action: 'contact', minimum_score: 0.1) && form.valid?
        EmailJob.perform_async(form)
        format.js { render 'deliver', locals: { form: form }, status: :ok }
      else
        format.json { render json: { errors: form.errors.messages.map{|k, v| { k => form.errors.full_messages_for(k).to_sentence }}.reduce(Hash.new, :merge) }, status: :unprocessable_entity }
      end
    end
  end

  private

  def form_params
    params.require(:form).permit(:first_name, :last_name, :email, :country, :telephone, :call_time)
  end

end