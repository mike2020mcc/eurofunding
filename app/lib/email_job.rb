class EmailJob

  include SuckerPunch::Job

  def perform(form)
    UserMailer.contact(form).deliver_now
    UserMailer.responder(form).deliver_now
  end

end