# == Schema Information
#
# Table name: taggings
#
#  id             :bigint(8)        not null, primary key
#  tag_id         :bigint(8)
#  observation_id :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :tagging do
    tag { nil }
    observation { nil }
  end
end
