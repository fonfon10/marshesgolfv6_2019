class CreateOpenCloses < ActiveRecord::Migration[6.0]
  def change
    create_table :open_closes do |t|
      t.string :name

      t.timestamps
    end
  end
end
