class ChangeDataTypeForStatus < ActiveRecord::Migration[6.1]
  def change
        change_column :projects, :status, :integer, using: 'status::integer'
  end
end
