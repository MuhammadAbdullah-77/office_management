class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.boolean :check_in
      t.date :date
      t.datetime :time
      t.integer :admin_id, foreign_key: true
      t.timestamps
    end
  end
end
