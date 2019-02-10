class AddTimestampsToFeeds < ActiveRecord::Migration[5.2]
  def change
    change_table(:feeds) { |t| t.timestamps }
  end
end
