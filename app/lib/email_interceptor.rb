class EmailInterceptor
  def self.delivering_email(message)
    message.to = ['Jay Ketcher <jay.ketcher@ajkoffshore.com>']
    message.subject = "[test] #{message.subject}"
  end
end