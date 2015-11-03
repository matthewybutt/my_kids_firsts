class AddChildToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :child, index: true, foreign_key: true
  end
end
