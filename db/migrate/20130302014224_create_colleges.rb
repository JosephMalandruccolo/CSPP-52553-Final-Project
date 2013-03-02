class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :officialName
      t.string :shortName
      t.string :city
      t.string :state
      t.string :logo
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :wikipedia

      t.timestamps
    end
  end
end
