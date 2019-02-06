class Podcast < ApplicationRecord
  has_many :users, through: :feeds
  validates :link, uniqueness: true
end
