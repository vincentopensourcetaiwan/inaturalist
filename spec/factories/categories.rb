# == Schema Information
#
# Table name: categories
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  chinese_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :category do
    name { "MyString" }
    chinese_name { "MyString" }
  end
end
