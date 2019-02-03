# == Schema Information
#
# Table name: roles
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  resource_type :string
#  resource_id   :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Role < ApplicationRecord
  USER = :user
  ADMIN = :admin
  EDITOR = :editor
  CONTRIBUTOR = :contributor

  validates :name, presence: true
  validates :name, uniqueness: true

  has_and_belongs_to_many :users, :join_table => :users_roles


  belongs_to :resource,
             :polymorphic => true,
             :optional => true


  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
end
