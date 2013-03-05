class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.integer :college_id
      t.string :relationship

      t.timestamps
    end


    add_index :statuses, :user_id
    add_index :statuses, :college_id
    add_index :statuses, [:user_id, :college_id], unique: true

  end
end
