class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age_group_id
      t.integer :membership_id
      t.integer :lesson

      t.timestamps
    end
  end
end
