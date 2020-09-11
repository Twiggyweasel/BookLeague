class CreateReads < ActiveRecord::Migration[6.0]
  def change
    create_table :reads do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :meeting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
