class UserMailerPreview < ActionMailer::Preview

  def contact
    UserMailer.contact(form)
  end

  def responder
    UserMailer.responder(form)
  end

  private 

  def form
    @form ||= EmailForm.new(first_name: 'Jay', last_name: 'Ketcher', email: 'jay.ketcher@ajkoffshore.com', country: 'PH', telephone: '+63 917 513 2366', call_time: 'Morning')
  end

end