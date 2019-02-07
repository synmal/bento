class AddImagesToPodcasts < ActiveRecord::Migration[5.2]
  def change
    add_column :podcasts, :images, :text
  end
end
