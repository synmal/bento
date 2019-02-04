class AddTagsToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :tags, :text, array: true, default: []
  end
end
