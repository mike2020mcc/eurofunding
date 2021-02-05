class PasswordFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/

    #unless value =~ /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$/i

      object.errors[attribute] << (options[:message] || "must be at least 8 characters long, contain at least one number, one lowercase letter, one uppercase letter and a symbol") 
    end
  end
end