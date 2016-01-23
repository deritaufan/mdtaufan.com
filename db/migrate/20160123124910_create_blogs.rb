class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :sub_title
      t.text :post

      t.timestamps null: false
    end
  end
end
