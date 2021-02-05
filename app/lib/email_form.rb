class EmailForm < ActiveInteraction::Base

  string :first_name, default: nil
  string :last_name, default: nil
  string :email, default: nil
  string :country, default: nil
  string :telephone, default: nil
  string :call_time, default: nil

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :email,
    email: true

  validates :country,
    inclusion: { in: Country.codes }

  validates :telephone,
    presence: true

  validates :call_time,
    presence: true

  def execute
  end

end