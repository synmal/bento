class Course < ApplicationRecord
  validates :link, uniqueness: true
end
