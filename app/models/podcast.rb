class Podcast < ApplicationRecord
  belongs_to :user
  validates :link, uniqueness: true
end
