# == Schema Information
#
# Table name: taggings
#
#  id             :bigint(8)        not null, primary key
#  tag_id         :bigint(8)
#  observation_id :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Tagging, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
