class CreateTicketDetails < ActiveRecord::Migration
  def change
    create_table :ticket_details do |t|
      
      t.decimal :price

      t.timestamps null: false
    end
  end
end
