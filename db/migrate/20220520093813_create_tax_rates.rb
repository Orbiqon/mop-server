class CreateTaxRates < ActiveRecord::Migration[6.1]
  def change
    create_table :tax_rates do |t|
      t.references :continent
      t.string :country
      t.string :rate
      t.string :total_rate
      t.string :on_shipping
      t.string :on_digital
      t.timestamps
    end
  end
end
