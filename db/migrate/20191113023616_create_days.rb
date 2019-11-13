class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.date :name
      t.integer :open_close_id

      t.timestamps
    end
  end
end
