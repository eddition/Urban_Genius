class CreateSongsWordsTable < ActiveRecord::Migration
  def up
    create_table :songs_words, :id => false do |t|
      t.integer :song_id
      t.integer :word_id
    end
  end

  def down
    drop_table :songs_words
  end
end
