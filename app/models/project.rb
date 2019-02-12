class Project < ApplicationRecord
  has_many :feeds
  has_many :users, through: :feeds
  validates :title, uniqueness: true
end
