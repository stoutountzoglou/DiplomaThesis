class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :user_id
      t.integer :trip_id
      t.integer :rating
      t.string :text

      t.timestamps
    end
  end
end
