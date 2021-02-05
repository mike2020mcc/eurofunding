# == Schema Information
#
# Table name: snippets
#
#  id         :integer          not null, primary key
#  group_id   :integer          not null
#  name       :string           not null
#  content    :string           not null
#  position   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Snippet < ApplicationRecord

  # See cache buster in application_record.rb
  
  acts_as_list scope: :group

  belongs_to :group, foreign_key: :group_id, inverse_of: :snippets

  validates :name,
    presence: true,
    uniqueness: { scope: :group_id }

  validates :content,
    presence: true

end
