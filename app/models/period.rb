# == Schema Information
#
# Table name: periods
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  start_year  :integer
#  start_month :integer
#  start_day   :integer
#  end_year    :integer
#  end_month   :integer
#  end_day     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  search_name :string
#

class Period < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :periodings
  has_many :observations, through: :periodings
end
