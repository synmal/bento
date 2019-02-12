class Video < ApplicationRecord
  has_many :feeds
  has_many :users, through: :feeds
  validates :url, uniqueness: true
end
