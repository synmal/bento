class IAmGettingAnnoyed < ActiveRecord::Migration[5.2]
  def change
      enable_extension "hstore"
      remove_column :users, :programming_level
      remove_column :users, :programming_languags
      add_column :users, :user_languages_skill, :hstore
      add_index :users, :user_languages_skill, using: :gin
  end
end
