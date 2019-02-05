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

  attr_reader :tag_tokens, :place_tokens

  has_many :photos
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :placings
  has_many :places, through: :placings
  has_many :periodings
  has_many :periods, through: :periodings


  belongs_to :user, optional: true
  belongs_to :category, optional: true

  def tag_tokens=(ids)
    self.tag_ids = ids.split(',')
  end

  def place_tokens=(ids)
    self.place_ids = ids.split(',')
  end

  algoliasearch do
    attribute :taxon_name, :description, :chinese_taxon_name, :category_name, :category, :user, :name, :tags, :places, :periods
  end

  if Rails.env.test?
    algoliasearch per_environment: true, disable_indexing: Rails.env.test? do
    end
  end

end
