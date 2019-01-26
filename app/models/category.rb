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

class Category < ApplicationRecord
  has_many :observations
end
