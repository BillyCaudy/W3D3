class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :shorturl_id
      t.timestamps
    end

    add_index :visits, :user_id, unique: true
    add_index :visits, :shorturl_id, unique: true
  end
end
