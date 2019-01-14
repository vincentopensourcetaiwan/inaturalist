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

require 'rails_helper'

RSpec.describe Photo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
