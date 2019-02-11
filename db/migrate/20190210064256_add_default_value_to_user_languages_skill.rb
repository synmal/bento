class AddDefaultValueToUserLanguagesSkill < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :user_languages_skill, :hstore, default: {'ruby': 'beginner', 'python': 'beginner', 'javascript': 'beginner'}
  end
end
