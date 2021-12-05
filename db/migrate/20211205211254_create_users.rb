class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.integer :credit_card_number
      t.integer :credit_card_zip_code
      t.date :credit_card_expiration

      t.timestamps
    end
  end
end
