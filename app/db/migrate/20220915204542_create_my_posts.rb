class CreateMyPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :my_posts do |t|
      t.string :choice
      t.timestamps null: false
    end
  end
end
