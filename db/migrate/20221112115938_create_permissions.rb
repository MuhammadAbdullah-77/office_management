class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.string :name, limit: 50
      t.boolean :value, default: false
      t.references :role, null: false, foreign_key: true
      t.timestamps
    end
  end
end
