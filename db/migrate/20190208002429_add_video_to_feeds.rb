class AddVideoToFeeds < ActiveRecord::Migration[5.2]
  def change
    add_reference :feeds, :video, foreign_key: true
  end
end
