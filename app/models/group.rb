# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  section_id :integer          not null
#  name       :string           not null
#  position   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord

  # See cache buster in application_record.rb

  acts_as_list scope: :section

  belongs_to :section, foreign_key: :section_id, inverse_of: :groups
  has_many :snippets, -> { order(position: :asc) }, inverse_of: :group, dependent: :destroy

  validates :name,
    presence: true,
    uniqueness: { scope: :section_id }


end
