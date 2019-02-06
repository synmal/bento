class Feed < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :podcast
end
