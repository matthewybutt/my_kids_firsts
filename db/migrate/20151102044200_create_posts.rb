class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :text
      t.string :image_url
      t.string :tag
      t.date :event_date

      t.timestamps null: false
    end
  end
end
