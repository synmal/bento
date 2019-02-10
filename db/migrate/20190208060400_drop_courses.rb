class DropCourses < ActiveRecord::Migration[5.2]
  def change
    drop_table :courses
    drop_table :puzzles
  end
end
