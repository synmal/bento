class RedoUserLanguageSkill < ActiveRecord::Migration[5.2]
  def change
    enable_extension "hstore"
    remove_column :users, :user_languages_skill
    add_column :users, :user_languages_skill, :hstore, default: {}
    add_index :users, :user_languages_skill, using: :gist
  end
end
