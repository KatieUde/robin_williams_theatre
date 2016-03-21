class CreateTicketPurchases < ActiveRecord::Migration
  def change
    create_table :ticket_purchases do |t|
      t.string :name
      t.string :email
      t.boolean :age_confirm
      t.string :cc_number
      t.string :cc_cvc
      t.string :cc_exp
      t.string :final_cost
      t.string :zip_code
      t.integer :movie_id
      t.integer :viewing_id

      t.timestamps null: false
    end
  end
end
