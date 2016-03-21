class AddTicketStyleToTicketDetails < ActiveRecord::Migration
  def change
    add_column :ticket_details, :ticket_style, :string
  end
end
