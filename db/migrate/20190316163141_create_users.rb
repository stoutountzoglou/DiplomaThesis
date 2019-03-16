class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :surname
      t.string :town
      t.text :about_me
      t.string :gender
      t.text :profile_picture_url
      t.string :password_digest

      t.timestamps
    end
  end
end
