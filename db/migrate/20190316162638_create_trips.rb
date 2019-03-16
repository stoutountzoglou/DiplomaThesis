class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :departure
      t.string :destination
      t.integer :user_id
      t.text :description
      t.timestamp :departure_time
      t.integer :duration
      t.integer :stops
      t.float :total_cost
      t.integer :max_travellers
      t.string :car_model

      t.timestamps
    end
  end
end
