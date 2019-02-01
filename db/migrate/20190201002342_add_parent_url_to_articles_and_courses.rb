class AddParentUrlToArticlesAndCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :parent_url, :string
    add_column :articles, :parent_url, :string
  end
end
