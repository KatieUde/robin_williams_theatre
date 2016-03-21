class RemoveAuditoriumIdFromViewings < ActiveRecord::Migration
  def change
    remove_column :viewings, :auditorium_id, :integer
  end
end
