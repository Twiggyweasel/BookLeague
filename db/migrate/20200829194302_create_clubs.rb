class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.date :founded
      t.text :description
      t.string :invite_code
      t.boolean :is_private, default: false

      t.timestamps
    end
  end
end
