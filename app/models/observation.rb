# == Schema Information
#
# Table name: observations
#
#  id                    :bigint(8)        not null, primary key
#  observation_id        :integer
#  observation_uri       :string
#  observation_photo_url :string
#  taxon_name            :string
#  description           :text
#  user_name             :string
#  user_login            :string
#  user_icon             :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Observation < ApplicationRecord
end
