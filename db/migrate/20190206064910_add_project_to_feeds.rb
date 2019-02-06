class AddProjectToFeeds < ActiveRecord::Migration[5.2]
  def change
    add_reference :feeds, :project, foreign_key: true
  end
end
