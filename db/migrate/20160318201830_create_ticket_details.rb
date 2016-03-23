class CreateTicketDetails < ActiveRecord::Migration
  def change
    create_table :ticket_details do |t|
      t.string :ticket_style
      t.string :value

      t.timestamps null: false
    end
  end
end
