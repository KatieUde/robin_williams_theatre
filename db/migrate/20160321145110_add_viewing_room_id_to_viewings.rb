class AddViewingRoomIdToViewings < ActiveRecord::Migration
  def change
    add_column :viewings, :viewing_room_id, :integer
  end
end
