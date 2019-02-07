class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.references :podcast, foreign_key: true
    end
  end
end
