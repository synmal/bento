class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :link
      t.string :creator
      t.text :tags, array: true
      t.timestamps
    end
  end
end
