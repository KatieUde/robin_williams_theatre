class RemoveValueFromTicketDetails < ActiveRecord::Migration
  def change
    remove_column :ticket_details, :value, :string
  end
end
