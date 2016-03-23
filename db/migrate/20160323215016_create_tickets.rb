class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :viewing_id
      t.integer :ticket_detail_id
      t.integer :ticket_purchase_id

      t.timestamps null: false
    end
  end
end
