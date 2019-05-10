class CreateKoalas < ActiveRecord::Migration[5.2]
  def change
    create_table :koalas do |t|
      t.string :name
      t.date :dob
      t.string :colour
      t.string :character
      t.string :favourite_food

      t.timestamps
    end
  end
end
