class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullName
      t.string :email
      t.integer :phoneNumber

      t.timestamps null: false
    end
  end
end
