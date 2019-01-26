# == Schema Information
#
# Table name: observations
#
#  id                 :bigint(8)        not null, primary key
#  inaturalist_id     :integer
#  uri                :string
#  photo_url          :string
#  taxon_name         :string
#  description        :text
#  user_name          :string
#  user_login         :string
#  user_icon          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  longitude          :float
#  latitude           :float
#  wikipedia_url      :string
#  chinese_taxon_name :string
#  user_id            :integer
#  category_id        :integer
#  category_name      :string
#

FactoryBot.define do
  factory :observation do
    observation_id { 1 }
    observation_uri { "MyString" }
    observation_photo_url { "MyString" }
    taxon_name { "MyString" }
    description { "MyText" }
    user_name { "MyString" }
    user_login { "MyString" }
    user_icon { "MyString" }
  end
end
