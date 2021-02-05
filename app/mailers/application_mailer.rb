class ApplicationMailer < ActionMailer::Base

  default from: 'Financial Solutions <admin@financialsolutions.asia>'
  default to: ['Admin <admin@financialsolutions.asia>', 'PA <pa@financialsolutions.asia>']
  #default bcc: ['Support <support@padfixer.com>']
  layout 'mailer'

end
