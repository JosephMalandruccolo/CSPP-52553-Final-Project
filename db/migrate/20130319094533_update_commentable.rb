class UpdateCommentable < ActiveRecord::Migration
  def change
  	rename_column :comments, :commentable_class, :commentable_type
  	add_index :comments, [:commentable_id, :commentable_type]
  end
end
