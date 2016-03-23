class AddTicketCostToTicketDetails < ActiveRecord::Migration
  def change
    add_column :ticket_details, :ticket_cost, :string
  end
end
