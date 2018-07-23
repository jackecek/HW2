class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :date
      t.string :reservation_code
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
