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
#

class Observation < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :taxon_name, :description, :chinese_taxon_name
  end
end
