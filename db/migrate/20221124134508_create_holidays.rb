class CreateHolidays < ActiveRecord::Migration[6.1]
  def change
    create_table :holidays do |t|
      t.string :reason
      t.date :start_date
      t.date :end_date
      t.integer :status
      t.integer :admin_id, foreign_key: true
      t.timestamps
    end
  end
end
