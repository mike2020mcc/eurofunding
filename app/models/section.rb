# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  position   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Section < ApplicationRecord

  # See cache buster in application_record.rb

  acts_as_list

  has_many :groups, -> { order(position: :asc) }, inverse_of: :section, dependent: :destroy

  default_scope { order(position: :asc) }

  validates :name,
    presence: true,
    uniqueness: true

end
