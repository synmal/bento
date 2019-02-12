class Article < ApplicationRecord
  has_many :feeds
  has_many :users, through: :feeds
  validates :link, uniqueness: true
end
