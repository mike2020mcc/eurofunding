# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  shufti_reference        :string
#  shufti_event            :string
#  shufti_verification_url :string
#  remittances             :boolean          default(FALSE), not null
#  banking                 :boolean          default(FALSE), not null
#  given_name              :string           not null
#  family_name             :string           not null
#  email                   :string           not null
#  country                 :string           not null
#  mobile                  :string           not null
#  password_digest         :string           not null
#  login_ip                :string           not null
#  login_country           :string           not null
#  login_at                :datetime         not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class User < ApplicationRecord

  has_secure_password
  strip_attributes

  validates :given_name,
    presence: true

  validates :family_name,
    presence: true

  validates :email,
    email: true,
    uniqueness: true

  validates :country,
    inclusion: { in: Country.codes }

  validates :mobile,
    presence: true

  validates :password,
    password_format: true,
    if: Proc.new {|instance| instance.password.present? || instance.changing_password? }

  validates :login_country,
    inclusion: { in: Country.codes }

  validates :login_at,
    presence: true


  def changing_password!
    @changing_password = true
  end

  def changing_password?
    !!@changing_password
  end

  def email=(value)
    super(value.to_s.strip.downcase.presence)
  end

  def full_name
    [family_name, given_name].join(', ')
  end

  def shufti_event_formatted 
    shufti_event.split('.').last.titlecase unless shufti_event.blank?
  end

  def country_name
    Country.try(:[], country).try('name') || 'Unknown'
  end

  def login!(ip)
    update_columns(login_ip: ip, login_country: CountriesService.lookup(ip), login_at: Time.current)
  end
  
end
