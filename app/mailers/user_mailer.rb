class UserMailer < ApplicationMailer

  default template_path: 'mailers/user'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer_mailer.contact.subject
  #
  def contact(form)
    @data = form
    subject = "#{@data.first_name} #{@data.last_name} sent a message from the Financial Solutions website"
    reply_to = "#{[@data.first_name.tr('<>', ''), @data.last_name.tr('<>', '')].join(' ')} <#{@data.email}>"
    mail(reply_to: reply_to, subject: subject)
  end

  def responder(form)
    @data = form
    subject = "Thank you for your enquiry #{@data.first_name}"
    mail(to: @data.email, subject: subject)
  end

end
