class EmailValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
      message = options[:message] || I18n.exists?('errors.messages.email_format') ? I18n.t('errors.messages.email_format') : I18n.t('errors.messages.invalid')
      object.errors[attribute] << message
    end
  end
end
