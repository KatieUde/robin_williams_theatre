class AddZipCodeToTicketPurchases < ActiveRecord::Migration
  def change
    add_column :ticket_purchases, :zip_code, :string
  end
end
