class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :name
      t.string :ombd_id
      t.string :ombd_poster
      t.boolean :playing_now
      t.boolean :upcoming

      t.timestamps null: false
    end
  end
end
