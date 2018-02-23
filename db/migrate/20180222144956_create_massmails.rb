class CreateMassmails < ActiveRecord::Migration
  def up
    create_table :massmails do |t|
      t.text :writeup
      t.timestamps null: false
    end
  end
  def down
    drop_table :massmails
  end
end
