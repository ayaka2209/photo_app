class Pictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.text :image
      t.text :content
      t.references :user
      t.timestamps
    end
  end
end
