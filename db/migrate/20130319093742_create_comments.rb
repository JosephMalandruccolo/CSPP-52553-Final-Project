class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_class
      t.integer :user_id
      t.integer :college_id
      t.text :text

      t.timestamps
    end
  end
end
