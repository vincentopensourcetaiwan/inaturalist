# == Schema Information
#
# Table name: placings
#
#  id             :bigint(8)        not null, primary key
#  place_id       :bigint(8)
#  observation_id :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Placing < ApplicationRecord
  belongs_to :place
  belongs_to :observation

  validates :place, uniqueness: { scope: :observation }
end
