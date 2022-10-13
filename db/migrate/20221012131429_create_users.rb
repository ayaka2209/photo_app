class CreateUsers < ActiveRecord::Migration[6.1]
  create_table :users do |t|
  def change
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
