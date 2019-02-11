class AddWeekToFeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :feeds, :week, :integer
  end
end
