class Article < ApplicationRecord
  validates :link, uniqueness: true
end
