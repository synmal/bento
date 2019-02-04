class Podcast < ApplicationRecord
  validates :link, uniqueness: true
end
