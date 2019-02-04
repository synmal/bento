class ChangeProgrammingLanguagesDeveloperTypeInterestDatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :programming_languages, :json, using: 'programming_languages::JSON'
    change_column :users, :developer_type, :json, using: 'developer_type::JSON'
    change_column :users, :interest, :json, using: 'interest::JSON'
  end
end