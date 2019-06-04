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
#  disabled           :boolean          default(FALSE), not null
#

class Observation < ApplicationRecord
  include SearchCop

  attr_reader :tag_tokens, :place_tokens, :period_tokens

  belongs_to :user, optional: true
  belongs_to :category, optional: true

  has_many :photos
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :placings
  has_many :places, through: :placings
  has_many :periodings
  has_many :periods, through: :periodings

  scope :enabled, -> { where(disabled: false) }
  scope :disabled, -> { where(disabled: true) }
  scope :order_by_id_asc, -> { order(id: :asc) }
  scope :order_by_id_desc, -> { order(id: :desc) }

  def period_tokens=(ids)
    self.period_ids = ids.split(',')
  end

  def tag_tokens=(ids)
    self.tag_ids = ids.split(',')
  end

  def place_tokens=(ids)
    self.place_ids = ids.split(',')
  end

  search_scope :search do
    attributes :taxon_name, :description, :chinese_taxon_name
    attributes user: ["user.nickname"]
    attributes category: ["category.name", "category.chinese_name"]
    attributes tag: ["tags.name"]
    attributes place: ["places.chinese_name"]
    attributes period: ["periods.name"]
  end

end
