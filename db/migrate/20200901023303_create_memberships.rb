class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.integer :role
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
