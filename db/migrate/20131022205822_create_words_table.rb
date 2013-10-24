class CreateWordsTable < ActiveRecord::Migration
  def up
    create_table :words do |t|
      t.string :name
      t.string :definition
      t.timestamps
    end
  end

  def down
    drop_table :words
  end
end
