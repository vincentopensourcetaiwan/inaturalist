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

class Place < ApplicationRecord
  ACCURACY = 0.001

  validates :name, :chinese_name, :longitude, :latitude, presence: true
  validates :name, :chinese_name, uniqueness: true

  has_many :placings
  has_many :observations, through: :placings
end
