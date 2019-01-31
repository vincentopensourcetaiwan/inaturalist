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
#  observed_at        :datetime
#  name               :string
#

class Observation < ApplicationRecord
  include AlgoliaSearch

  HIT_PER_PAGE = 25

  has_many :photos
  belongs_to :user
  belongs_to :category

  algoliasearch do
    attribute :taxon_name, :description, :chinese_taxon_name, :category_name, :category, :user, :name
  end
end
