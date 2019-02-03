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

FactoryBot.define do
  factory :placing do
    place { nil }
    observation { nil }
  end
end
