# == Schema Information
#
# Table name: photos
#
#  id             :bigint(8)        not null, primary key
#  url            :string
#  observation_id :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :photo do
    url { "MyString" }
    observation { nil }
  end
end
