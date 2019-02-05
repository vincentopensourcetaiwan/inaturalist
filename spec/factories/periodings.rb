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

FactoryBot.define do
  factory :perioding do
    period { nil }
    observation { nil }
  end
end
