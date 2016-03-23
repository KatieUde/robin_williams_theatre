class CreateViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.integer :movie_id
      t.integer :viewing_room_id
      t.string :view_time
      t.date :view_date

      t.timestamps null: false
    end
  end
end
