class AddPublishedDateToPodcasts < ActiveRecord::Migration[5.2]
  def change
    add_column :podcasts, :published_at, :datetime
  end
end
