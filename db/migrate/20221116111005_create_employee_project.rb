class CreateEmployeeProject < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_projects do |t|
      t.references :project, foreign_key: true
      t.references :admin, foreign_key: true
      t.timestamps
    end
  end
end
