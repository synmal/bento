class AddUserLanguageSkillsToUsers < ActiveRecord::Migration[5.2]
  def change
      # a Postgresql extension that allows hashes to be stored in the table
      enable_extension "hstore"
      add_column :users, :user_languages_skill, :hstore
      add_index :users, :user_languages_skill, :gin
      remove_column :users, :programming_level
      remove_column :users, :programming_languages
  end
end
