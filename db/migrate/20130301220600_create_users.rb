class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :birthMonth
      t.integer :birthday
      t.integer :birthYear
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
