class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.integer :parent_id
      t.text :text

      t.timestamps
    end
  end
end
