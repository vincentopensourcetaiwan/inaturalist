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

class Photo < ApplicationRecord
  belongs_to :observation
end
