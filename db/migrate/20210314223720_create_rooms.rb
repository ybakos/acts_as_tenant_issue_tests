class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.belongs_to :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end