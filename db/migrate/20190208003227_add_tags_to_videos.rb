class AddTagsToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :tags, :text, array: true, default: []
  end
end
