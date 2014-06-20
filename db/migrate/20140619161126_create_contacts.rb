class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :FirstName
      t.string :LastName
      t.string :EmailId
      t.integer :MobileNumber
      t.string :Address

      t.timestamps
    end
  end
end
