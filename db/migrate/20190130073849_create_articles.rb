class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.string :image
      t.text :content
      t.timestamps
    end
  end
end
