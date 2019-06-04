class CreateCorporations < ActiveRecord::Migration[5.2]
  def change
    create_table :corporations do |t|
      t.string :name
      t.string :ceo
      t.decimal :market_price
      t.date :date_foundation
      t.text :description

      t.timestamps
    end
  end
end
