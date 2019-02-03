# == Schema Information
#
# Table name: places
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  chinese_name :string
#  longitude    :float
#  latitude     :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :place do
    name { "#{Faker::Name.name}-#{SecureRandom.uuid }" }
    chinese_name { "#{Faker::Name.name}-#{SecureRandom.uuid }" }
    longitude { 1.5 }
    latitude { 1.5 }
  end
end
