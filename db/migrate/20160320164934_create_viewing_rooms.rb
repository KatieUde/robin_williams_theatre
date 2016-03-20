class CreateViewingRooms < ActiveRecord::Migration
  def change
    create_table :viewing_rooms do |t|
      t.integer :room_number
      t.integer :seat_max

      t.timestamps null: false
    end
  end
end
