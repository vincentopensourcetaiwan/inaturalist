# == Schema Information
#
# Table name: periodings
#
#  id             :bigint(8)        not null, primary key
#  period_id      :bigint(8)
#  observation_id :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Perioding < ApplicationRecord
  belongs_to :period
  belongs_to :observation

  validates :period, uniqueness: { scope: :observation }
end
