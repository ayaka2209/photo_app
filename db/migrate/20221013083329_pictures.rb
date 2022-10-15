class Pictures < ActiveRecord::Migration[6.1]
  create_table :pictures do |t|
  def change
      t.text :image
      t.text :content
      t.references :user
      t.timestamps
    end
  end
end
