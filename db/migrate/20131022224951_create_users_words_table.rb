class CreateUsersWordsTable < ActiveRecord::Migration
  def up
    create_table :users_words, :id => false do |t|
      t.integer :user_id
      t.integer :word_id
    end
  end

  def down
      drop_table :users_words
  end
end
