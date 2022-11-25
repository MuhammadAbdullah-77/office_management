class AddColumnToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :country, :string
    add_column :admins, :city, :string
    add_column :admins, :address, :text
    add_column :admins, :joining_date, :date
    add_column :admins, :dob, :date
    add_column :admins, :phone_no, :string
    add_column :admins, :cnic, :string
  end
end
